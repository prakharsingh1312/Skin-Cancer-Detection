from config import *
from flask import  render_template, request , session , redirect , url_for,flash
import pandas as pd
import numpy as np
from sklearn.ensemble import ExtraTreesRegressor
from sklearn.model_selection import StratifiedKFold, KFold
from sklearn.metrics import mean_squared_error
import pickle
import hashlib
from fastai import *
from fastai.vision import *
from werkzeug.utils import secure_filename
from statistics import mode
from detect import *

#Tables

class Test_Graphs(db.Model):
	__tablename__='TABLE 1'
	id=db.Column('id', db.Integer , primary_key=True)
	name=db.Column('image_name' , db.String(12))
	patient_id=db.Column('patient_id' , db.String(10))
	sex=db.Column('sex' , db.String(6))
	age_approx=db.Column('age_approx' , db.String(3))
	anatom_site_general_challenge=db.Column('anatom_site_general_challenge' , db.String(15))
	diagnosis=db.Column('diagnosis' , db.String(34))
	benign_malignant=db.Column('benign_malignant' , db.String(9))
	target=db.Column('target' , db.Integer)

class UserTable(db.Model):
	__tablename__='user_table'
	id=db.Column('id', db.Integer, primary_key=True)
	name=db.Column('name' , db.String(100))
	email=db.Column('email' , db.String(100))
    #location=db.Column('location' , db.String(100))
	gender=db.Column('gender' , db.String(1))
	dob=db.Column('dob', db.Date)
	password=db.Column('password',db.String(100))
	role=db.Column('role',db.Integer)
	user_activated=db.Column('user_activated',db.Integer)
#db.drop_all()
db.create_all()
#Functions
#Login/Signup
def crypt_password(password):
	salt='SkinCancer'
	password=str(password)+salt
	password=hashlib.md5(password.encode())
	return password.hexdigest()

def login(email , password):
	if(UserTable.query.filter_by(email=email).count()):
		user=UserTable.query.filter_by(email=email).first()
		password=crypt_password(password)
		if not user.user_activated:
			return 3
		elif user.password == password:
			session['user_id']=user.id
			session['user_name']=user.name
			session['user_role']=user.role
			return 1
		else:
			return 0
	return 2


def signup(name,password,email,dob,gender):

	if(UserTable.query.filter_by(email=email).count()):
		return 0
	#user_hash = random.randint(0,1000)
	#user_hash=crypt_password(user_hash)
	#token=crypt_password(email)
	#reciever=[]
	#reciever.append(email)
	user=UserTable(name = name , password = password , email = email , gender=gender , dob=dob , role=3 , user_activated=1 )
	#subject='Login | Verification'
	#message="You can login after you have verified your email address. Please click this link to verify you email address: http://3.6.235.34:5000/verify?token="+str(token)+"&hash="+str(user_hash)+"&verify"
	#if send_mail(message , reciever , subject):
	db.session.add(user)
	db.session.commit()
	return 1
	#return 0
def logout():
	session.pop('user_id',None)
	session.pop('user_name',None)
	return 1

#Tumor Prediction
def rmse(y_true,y_pred):
    return np.sqrt(mean_squared_error(y_true,y_pred))
#tester=[6630,2919,0.42116,51,90000,40]
def tumor_size(tester):
	train = pd.read_csv(os.path.join(os.path.dirname(__file__), 'Train.csv'))
	test = pd.read_csv(os.path.join(os.path.dirname(__file__), 'Test.csv'))
	sample = pd.read_csv(os.path.join(os.path.dirname(__file__), 'sample_submission.csv'))
	X = train.drop(['tumor_size'],axis=1)
	y = train['tumor_size'].copy()

	model = ExtraTreesRegressor(n_jobs=-1,n_estimators=200)

	model.fit(X, y)


	tester=np.array(tester)
	tester=tester.reshape(-1,len(tester))

	'''with open('regressor.pickle','rb') as f:
					model=pickle.load(f)
			'''

	return (model.predict(tester)[0])

#Cancer Prediction
def predict_cancer(image):
	res={}
	#print(os.path.join(os.path.dirname(__file__),'static/uploads/'+image))
	model = load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'pseudo_binary.pkl')
	dataset=['NEGATIVE','POSITIVE']
	img=open_image(os.path.join(os.path.dirname(__file__),'static/uploads/'+image))
	use_this(os.path.join(os.path.dirname(__file__),'static/uploads/'+image))
	tens=model.predict(img)[-1].numpy()
	tens1=model.predict(img)[-1].numpy()
	res['prediction']=str(dataset[np.argmax(tens1)])
	res['probability']=str(np.max(tens1))
	res['path']=image
	return res


def predict_malig_type(image):
	res={}
	lister=['Actinic keratosis','Basal cell carcinoma','Benign keratosis','Dermatofibroma','Melanoma','Melanocytic nevus','Vascular lesion']
	model=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'malignant.pkl')
	densenet=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'densenet121.pkl')
	resnet=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'resnet50.pkl')
	vgg16=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'vgg16bn.pkl')
	img=open_image(os.path.join(os.path.dirname(__file__),'static/uploads/'+image))
	res['probability']=str(model.predict(img)[-1].numpy()[1])
	tens1=densenet.predict(img)[-1].numpy()
	tens2=resnet.predict(img)[-1].numpy()
	tens3=vgg16.predict(img)[-1].numpy()
	c1=lister[np.argmax(tens1)]
	c2=lister[np.argmax(tens2)]
	c3=lister[np.argmax(tens3)]
	try:
		g=mode([c1,c2,c3])
	except:
		g=c3
	res['type']=g
	res['path']=image
	return res



def upload_file(file):
        file.save(os.path.join(os.path.dirname(__file__),'static/uploads/'+secure_filename(file.filename)))
        return secure_filename(file.filename)



#print(tumor_size(tester))
#Charts Data
#def
