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
db.drop_all()
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

#Tumor Prediction
def rmse(y_true,y_pred):
    return np.sqrt(mean_squared_error(y_true,y_pred))
#tester=[6630,2919,0.42116,51,90000,40]
def tumor_size(tester):
	train = pd.read_csv(os.path.join(os.path.dirname(__file__), 'Train.csv'))
	test = pd.read_csv(os.path.join(os.path.dirname(__file__), 'Test.csv'))
	sample = pd.read_csv(os.path.join(os.path.dirname(__file__), 'sample_submission.csv'))
	X = train.drop(['tumor_size','std_dev_malign', 'err_malign', 'malign_penalty'],axis=1)
	y = train['tumor_size'].copy()
	
	tester.append(tester[3]/tester[5])
	tester.append(tester[0]/tester[4])
	tester.append(tester[5]/tester[3])

	#Feature_Engineering
	X['NF'] = X['damage_size']/X['damage_ratio']
	test['NF'] = test['damage_size']/test['damage_ratio']

	X['NF2'] = X['mass_npea']/X['exposed_area']
	test['NF2'] = test['mass_npea']/test['exposed_area']

	X['NF6'] = X['damage_ratio']/X['damage_size']
	test['NF6'] = test['damage_ratio']/test['damage_size']


	'''scores = []
				#Regressor Training
				for tr_in, val_in in KFold(random_state=48).split(X, y):
				    X_train, y_train, X_val, y_val = X.iloc[tr_in], y[tr_in], X.iloc[val_in], y[val_in]
				    model = ExtraTreesRegressor(n_jobs=-1,n_estimators=200)
				    model.fit(X_train, y_train)
				    scores.append(rmse(y_val,model.predict(X_val)))
				print(np.mean(scores))'''


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
	print(os.path.join(os.path.dirname(__file__),'uploads/'+image))
	model = load_learner('large_files/')
	dataset=['Negative','Positive']
	img=open_image(os.path.join(os.path.dirname(__file__),'uploads/'+image))
	tens=model.predict(img)[-1].numpy()
	tens1=model.predict(img)[-1].numpy()
	return('Predicted'+str(dataset[np.argmax(tens1)])+'with probability '+str(np.max(tens1)))



def upload_file(file):
	file.save('uploads/'+secure_filename(file.filename))
	return file.filename


#print(tumor_size(tester))
#Charts Data
#def 
