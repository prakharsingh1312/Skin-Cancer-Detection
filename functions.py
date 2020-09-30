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
import uuid
import datetime
from flask_weasyprint import HTML, render_pdf
from script import *

#Tables
lang=db.Table('lang_doc',
	db.Column('doc_id',db.Integer,db.ForeignKey('doctor_details.id')),
	db.Column('lang_id',db.Integer,db.ForeignKey('languages_table.id'))
)

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
	image=db.Column('image' , db.String(100),default="user.jpg")
	locality_id=db.Column('locality_id' , db.Integer,db.ForeignKey('locality_table.id'))
	role=db.Column('role',db.Integer)
	user_activated=db.Column('user_activated',db.Integer)
	details=db.relationship('DoctorDetails',backref='doctor')
	notifications=db.relationship('Notifications',backref='user')
	prescriptions=db.relationship('Prescriptions',backref='patient')
	blogs=db.relationship('Blog',backref='blogs')
	comments=db.relationship('Comment',backref='comments')
	b_reactions=db.relationship('BlogReactions',backref='b_reactions')
	c_reactions=db.relationship('CommentReactions',backref='c_reactions')
	#locality=db.relationship('Locality',backref='user')

class DoctorDetails(db.Model):
	__tablename__='doctor_details'
	id=db.Column('id', db.Integer, primary_key=True)
	user_id=db.Column('user_id',db.Integer,db.ForeignKey('user_table.id'))
	qualification=db.Column('qual_id',db.Integer,db.ForeignKey('qualifications_table.id'))
	department=db.Column('dept_id' , db.Integer,db.ForeignKey('departments_table.id'))
	hospital_id=db.Column('hospital_id',db.Integer,db.ForeignKey('hospitals_table.id'))
	experience=db.Column('doc_exp' , db.String(100))
	#hospital=db.relationship('Hospital',backref='doctor')
	appointments=db.relationship('Appointments',backref='doctor')

class Qualifications(db.Model):
	__tablename__='qualifications_table'
	id=db.Column('id', db.Integer, primary_key=True)
	qualification=db.Column('qualification' , db.String(100))
	doctor=db.relationship('DoctorDetails',backref='qual_details')

class Departments(db.Model):
	__tablename__='departments_table'
	id=db.Column('id', db.Integer, primary_key=True)
	department=db.Column('department' , db.String(100))
	doctor=db.relationship('DoctorDetails',backref='dept_details')

class Languages(db.Model):
	__tablename__='languages_table'
	id=db.Column('id', db.Integer, primary_key=True)
	language=db.Column('language',db.String(100))
	doctors=db.relationship('DoctorDetails',secondary=lang,backref='doctors')

class Notifications(db.Model):
	__tablename__='notifications_table'
	id=db.Column('id', db.Integer, primary_key=True)
	user_id=db.Column('user_id',db.Integer,db.ForeignKey('user_table.id'))
	desc=db.Column('desc',db.String(100))
	link_to=db.Column('link_to',db.String(100))
	time=db.Column('time',db.DateTime)
	status=db.Column('status',db.Integer,default=1)

class Appointments(db.Model):
	__tablename__='appointments_table'
	id=db.Column('id', db.Integer, primary_key=True)
	time=db.Column('time',db.DateTime)
	link_to=db.Column('link_to',db.String(100))
	desc=db.Column('desc',db.String(100))
	prescription_id=db.Column('patient_id',db.Integer,db.ForeignKey('prescriptions_table.id'))
	doctor_id=db.Column('doctor_id',db.Integer,db.ForeignKey('doctor_details.id'))
	status=db.Column('status',db.Integer,default=1)
class Prescriptions(db.Model):
	__tablename__='prescriptions_table'
	id=db.Column('id', db.Integer, primary_key=True)
	patient_id=db.Column('patient_id',db.Integer,db.ForeignKey('user_table.id'))
	#doctor_id=db.Column('doctor_id',db.Integer,db.ForeignKey('doctor_details.id'))
	affected_area=db.Column('affected_area',db.String(10))
	desc=db.Column('desc',db.String(10000))
	image=db.Column('image_path',db.String(10000))
	cancer=db.Column('cancer',db.String(10))
	cancer_probability=db.Column('cancer_probability',db.Float)
	malignant_probability=db.Column('malignant_probability',db.Float)
	type_prediction=db.Column('type',db.Integer,db.ForeignKey('cancer_types.id'))
	time_of_examination=db.Column('time_of_examination',db.DateTime, default=datetime.datetime.utcnow)
	appointments=db.relationship('Appointments',backref='prescription')

class CancerTypes(db.Model):
	__tablename__='cancer_types'
	id=db.Column('id', db.Integer, primary_key=True)
	type=db.Column('type',db.String(100))
	home_remedy=db.Column('home_remedy',db.String(10000))
	patients=db.relationship('Prescriptions',backref='cancer_type')

class Hospitals(db.Model):
	__tablename__='hospitals_table'
	id=db.Column('id', db.Integer, primary_key=True)
	name=db.Column('name',db.String(100))
	doctors=db.relationship('DoctorDetails',backref='hospital')

class Locality(db.Model):
	__tablename__='locality_table'
	id=db.Column('id', db.Integer, primary_key=True)
	name=db.Column('name',db.String(1000))
	user=db.relationship('UserTable',backref='locality')

class Blog(db.Model):
	__tablename__='blog_table'
	id=db.Column('id', db.Integer, primary_key=True)
	user_id=db.Column('user_id',db.Integer,db.ForeignKey('user_table.id'))
	title=db.Column('title',db.String(1000))
	desc=db.Column('desc',db.String(10000))
	image=db.Column('image',db.String(1000))
	link=db.Column('link',db.String(1000))
	time=db.Column('time',db.DateTime,default=datetime.datetime.utcnow)

class Comment(db.Model):
	__tablename__='comment_table'
	id=db.Column('id', db.Integer, primary_key=True)
	user_id=db.Column('user_id',db.Integer,db.ForeignKey('user_table.id'))
	blog_id=db.Column('blog_id',db.Integer,db.ForeignKey('blog_table.id'))
	desc=db.Column('desc',db.String(10000))
	time=db.Column('time',db.DateTime,default=datetime.datetime.utcnow)

class BlogReactions(db.Model):
	__tablename__='blog_reactions_table'
	id=db.Column('id', db.Integer, primary_key=True)
	user_id=db.Column('user_id',db.Integer,db.ForeignKey('user_table.id'))
	blog_id=db.Column('blog_id',db.Integer,db.ForeignKey('blog_table.id'))
	reaction_type=db.Column('reaction_type', db.Integer)


class CommentReactions(db.Model):
	__tablename__='comment_reactions_table'
	id=db.Column('id', db.Integer, primary_key=True)
	user_id=db.Column('user_id',db.Integer,db.ForeignKey('user_table.id'))
	comment_id=db.Column('comment_id',db.Integer,db.ForeignKey('blog_table.id'))
	reaction_type=db.Column('reaction_type', db.Integer)


#db.drop_all()
#db.create_all()
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
			session['image']=user.image
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
def predict_cancer(image,affected_area):

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
	pres=Prescriptions(patient_id=session['user_id'],affected_area=affected_area,image=image,cancer_probability=float(res['probability']),cancer=res['prediction'])
	db.session.add(pres)
	db.session.commit()
	return res


def predict_malig_type(image):
	pres=Prescriptions.query.filter_by(image=image).first()
	res={}
	lister=['Actinic keratosis','Basal cell carcinoma','Benign keratosis','Dermatofibroma','Melanoma','Melanocytic nevus','Vascular lesion']
	model=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'malignant.pkl')
	densenet=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'densenet121.pkl')
	resnet=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'resnet50.pkl')
	vgg16=load_learner(os.path.join(os.path.dirname(__file__),'large_files/'),'vgg16bn.pkl')
	img=open_image(os.path.join(os.path.dirname(__file__),'static/uploads/'+image))
	res['probability']=str(round(((model.predict(img)[-1].numpy()[1])*100),2))
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
	pres.malignant_probability=float(res['probability'])
	pres.type_prediction=CancerTypes.query.filter_by(type=g).first().id
	db.session.commit()
	return res



def upload_file(file):
	last=file.filename.split('.')
	unique_filename = str(uuid.uuid4())+"."+last[-1]
	file.save(os.path.join(os.path.dirname(__file__),'static/uploads/'+secure_filename(unique_filename)))
	return secure_filename(unique_filename)



#print(tumor_size(tester))
#Charts Data
#def
#doctorsPage
def show_doctors():
	doctors=UserTable.query.filter_by(role=2).all()
	det=DoctorDetails.query.all();
	dept=Departments.query.all();
	qual=Qualifications.query.all();
	hosp=Hospitals.query.all();
	details={}
	for detail in det:
		details[detail.user_id]=detail
	department={}
	for dep in dept:
		department[dep.id]=dep
	qualification={}
	for q in qual:
		qualification[q.id]=q
	hospital={}
	for h in hosp:
		hospital[h.id]=h

	return doctors,details,department,qualification,hospital
def show_history():
	area={"NF":"Neck/Face","UA":"Upper Abdomen","LA":"Lower Abdomen","A":"Arms"}
	history=Prescriptions.query.filter_by(patient_id = session['user_id']).all()
	return history,area
def book_appointment(p):
	appoint=Appointments(prescription_id=p['pres_id'], doctor_id=p['doctor_id'], time=p['time'])
	db.session.add(appoint)
	db.session.commit()
def show_appointments():
	if session['user_role']==3:
		data=db.session.query(UserTable,Prescriptions,Appointments,DoctorDetails,Hospitals).filter(db.and_(Prescriptions.patient_id==session['user_id'],Appointments.doctor_id==UserTable.id,Appointments.prescription_id==Prescriptions.id,DoctorDetails.user_id==UserTable.id,Hospitals.id==DoctorDetails.hospital_id)).order_by(Appointments.time.desc()).all()
	elif session['user_role']==2:
		data=db.session.query(UserTable,Prescriptions,Appointments).filter(db.and_(Appointments.doctor_id==session['user_id'],Appointments.prescription_id==Prescriptions.id,Prescriptions.patient_id==UserTable.id)).order_by(Appointments.time.desc()).all()
	return data
def get_report(pres_id,app_id=0):
	user_data=db.session.query(UserTable).filter(UserTable.id==session['user_id']).first()
	if app_id==0:
		data=db.session.query(Prescriptions,CancerTypes).filter(db.and_(Prescriptions.id==pres_id,Prescriptions.type_prediction==CancerTypes.id)).first()
	else:
		data=db.session.query(Appointments,UserTable,Prescriptions,CancerTypes).filter(db.and_(Appointments.id==app_id,Prescriptions.id==Appointments.prescription_id,UserTable.id==Appointments.doctor_id,Prescriptions.type_prediction==CancerTypes.id)).first()
	area={"NF":"Neck/Face","UA":"Upper Abdomen","LA":"Lower Abdomen","A":"Arms"}
	return user_data,data,area
def write_prescription(p,q):
	if(db.session.query(Appointments).filter(db.and_(Appointments.id==p['app_id'], Appointments.doctor_id==session['user_id'])).count()):
		data=db.session.query(Appointments).filter(db.and_(Appointments.id==p['app_id'], Appointments.doctor_id==session['user_id'])).first()
		data.desc=q['pres_desc']
		db.session.commit()
		return 1
	return 0
def show_prescription(p):
	data=db.session.query(Appointments,UserTable,Prescriptions,CancerTypes).filter(db.and_(Appointments.id==p['app_id'],Prescriptions.id==Appointments.prescription_id,UserTable.id==Appointments.doctor_id,Prescriptions.type_prediction==CancerTypes.id)).first()
	user_id=data.Prescriptions.patient_id
	user_data=db.session.query(UserTable).filter(UserTable.id==user_id).first()
	area={"NF":"Neck/Face","UA":"Upper Abdomen","LA":"Lower Abdomen","A":"Arms"}
	return user_data,data,area

def close_appointment(p):
	if(db.session.query(Appointments).filter(db.and_(Appointments.id == p['app_id'], Appointments.doctor_id==session['user_id'])).count()):
		data=db.session.query(Appointments).filter(db.and_(Appointments.id == p['app_id'], Appointments.doctor_id==session['user_id'])).first()
		data.status=0
		db.session.commit()
		return 1
	return 0

def show_notifications():
	notifications_count=db.session.query(Notifications).filter(Notifications.status==1).order_by(Notifications.time.desc()).count()
	notifications=db.session.query(Notifications).order_by(Notifications.time.desc(),Notifications.status.desc()).all()
	return notifications_count,notifications

def show_blogs():
	upvotes_subq=(db.session.query(BlogReactions.blog_id,db.func.count(BlogReactions.id).label("Upvotes")).filter(BlogReactions.reaction_type==1).group_by(BlogReactions.blog_id)).subquery()
	downvotes_subq=(db.session.query(BlogReactions.blog_id,db.func.count(BlogReactions.id).label("Downvotes")).filter(BlogReactions.reaction_type==2).group_by(BlogReactions.blog_id)).subquery()
	data=db.session.query(Blog,db.func.timediff(db.func.utc_timestamp(),Blog.time).label("timediff"),UserTable,upvotes_subq.c.Upvotes,downvotes_subq.c.Downvotes).outerjoin(UserTable).outerjoin(upvotes_subq,upvotes_subq.c.blog_id==Blog.id).outerjoin(downvotes_subq,downvotes_subq.c.blog_id==Blog.id).all()

	#members = [attr for attr in dir(data[0]) if not callable(getattr(data[0], attr)) and not attr.startswith("__")]
	#print(members)
	return data

def create_post(p,type,image=""):
	data=Blog(user_id=session['user_id'],title=p['title'],desc=p['desc'])
	if type==1:
		data.link=p['link']
	elif type==2:
		data.image=image
	db.session.add(data)
	db.session.commit()
	return 1

def show_post(id):
	cupvotes_subq=(db.session.query(CommentReactions.comment_id,db.func.count(CommentReactions.id).label("CUpvotes")).filter(CommentReactions.reaction_type==1).group_by(CommentReactions.comment_id)).subquery()
	cdownvotes_subq=(db.session.query(CommentReactions.comment_id,db.func.count(CommentReactions.id).label("CDownvotes")).filter(CommentReactions.reaction_type==2).group_by(CommentReactions.comment_id)).subquery()
	comment=db.session.query(Comment,UserTable,cupvotes_subq.c.CUpvotes,cdownvotes_subq.c.CDownvotes).filter(Comment.blog_id==id).outerjoin(UserTable).outerjoin(cupvotes_subq,cupvotes_subq.c.comment_id==Comment.id).outerjoin(cdownvotes_subq,cdownvotes_subq.c.comment_id==Comment.id).order_by(Comment.time.desc())
	upvotes_subq=(db.session.query(BlogReactions.blog_id,db.func.count(BlogReactions.id).label("Upvotes")).filter(BlogReactions.reaction_type==1).group_by(BlogReactions.blog_id)).subquery()
	downvotes_subq=(db.session.query(BlogReactions.blog_id,db.func.count(BlogReactions.id).label("Downvotes")).filter(BlogReactions.reaction_type==2).group_by(BlogReactions.blog_id)).subquery()
	data=db.session.query(Blog,UserTable,db.func.timediff(db.func.utc_timestamp(),Blog.time).label("timediff"),upvotes_subq.c.Upvotes,downvotes_subq.c.Downvotes).filter(Blog.id==id).outerjoin(UserTable).outerjoin(upvotes_subq,upvotes_subq.c.blog_id==Blog.id).outerjoin(downvotes_subq,downvotes_subq.c.blog_id==Blog.id).first()
	user_data=db.session.query(UserTable).filter(UserTable.id==session['user_id']).first()
	#members = [attr for attr in dir(comment[0]) if not callable(getattr(comment[0], attr)) and not attr.startswith("__")]
	#print(members)
	return data,comment,user_data

def post_comment(p):
	data=Comment(blog_id=p['blog_id'],desc=p['comment'],user_id=session['user_id'])
	db.session.add(data)
	db.session.commit()
	return 1

def react_comment(p,react):
	if(CommentReactions.query.filter_by(user_id=session['user_id']).count()):
		data=CommentReactions.query.filter_by(user_id=session['user_id']).first()
		data.reaction_type=react
	else:
		data=CommentReactions(comment_id=p['comment_id'],reaction_type=react,user_id=session['user_id'])
		db.session.add(data)
	db.session.commit()
	return 1

def react_blog(p,react):
	if(BlogReactions.query.filter_by(user_id=session['user_id']).count()):
		data=BlogReactions.query.filter_by(user_id=session['user_id']).first()
		data.reaction_type=react
	else:
		data=BlogReactions(blog_id=p['blog_id'],reaction_type=react,user_id=session['user_id'])
		data.reaction_type=react
	db.session.commit()
	return 1
