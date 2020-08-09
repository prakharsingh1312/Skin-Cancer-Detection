import os
from flask import Flask ,  render_template, request , session , redirect , url_for,flash
import pandas as pd
import numpy as np
from sklearn.ensemble import ExtraTreesRegressor
from sklearn.model_selection import StratifiedKFold, KFold
from sklearn.metrics import mean_squared_error
import pickle
#from fastai import *
#from fastai.vision import *
from werkzeug.utils import secure_filename

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


def predict_cancer(image):
	model = load_learner(os.path.join(os.path.dirname(__file__), 'large_files/cancer_classifier.pkl'))
	dataset=['Negative','Positive']
	img=open_image(os.path.join(os.path.dirname(__file__),'uploads/'+image))
	tens=learn.predict(img)[-1].numpy()
	tens1=learn.predict(img)[-1].numpy()
	return('Predicted'+str(dataset[np.argmax(tens1)])+'with probability '+str(np.max(tens1)))
def upload_file(file):
	file.save(secure_filename(file.filename))
	return file.filename


#print(tumor_size(tester))
