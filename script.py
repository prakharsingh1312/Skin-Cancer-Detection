import os
import nltk
from nltk.stem.lancaster import LancasterStemmer
stemmer=LancasterStemmer()
import pickle
import numpy
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import random
import json
import pyttsx3
from statistics import mode

def tts(txt):
	engine=pyttsx3.init()
	engine.say(txt)
	engine.runAndWait()

#print(os.path.join(os.path.dirname(__file__),'model_saved.h5'))
try:

	with open(os.path.join(os.path.dirname(__file__),'data.pickle'),'rb') as f:
		words,labels,training,output=pickle.load(f)
		print (words)
except:
	with open(os.path.join(os.path.dirname(__file__),'intents.json')) as file:
		data=json.load(file)

	words=[]
	labels=[]
	docs_x=[]
	docs_class=[]
	for intent in data['intents']:
		for pattern in intent['patterns']:
			word_single=nltk.word_tokenize(pattern)
			words.extend(word_single)
			docs_x.append(word_single)
			docs_class.append(intent['tag'])
		if intent['tag'] not in labels:
			labels.append(intent['tag'])

	words=[stemmer.stem(w.lower()) for w in words if w not in '?']
	words=sorted(list(set(words)))

	labels=sorted(labels)

	training=[]
	output=[]
	out_empty=[0 for _ in range(len(labels))]

	for x,doc in enumerate(docs_x):
		bag=[]

		word_single=[stemmer.stem(w) for w in doc]

		for w in words:

			if w in word_single:
				bag.append(1)
			else:
				bag.append(0)
		output_row=out_empty[:]
		output_row[labels.index(docs_class[x])]=1

		training.append(bag)
		output.append(output_row)
	training=numpy.array(training)
	output=numpy.array(output)

	with open(os.path.join(os.path.dirname(__file__),'data.pickle'),'wb') as f:
		pickle.dump((words,labels,training,output),f)

try:
	model=keras.models.load_model(os.path.join(os.path.dirname(__file__),'model_saved.h5'))


except:
	model = tf.keras.models.Sequential()
	model.add(tf.keras.Input(shape=len(training[0])))
	model.add(tf.keras.layers.Dense(8))
	model.add(tf.keras.layers.Dense(8))
	model.add(tf.keras.layers.Dense(8))
	model.add(tf.keras.layers.Dense(len(output[0])))
	model.compile(loss='mean_squared_error',optimizer='adam',metrics=['accuracy'])
	model.fit(training,output,epochs=100,verbose=1)
	model.save(os.path.join(os.path.dirname(__file__),'model_saved.h5'))

def bag_of_words(s,words):

	bag=[0 for _ in range(len(words))]
	s_words=nltk.word_tokenize(s)
	s_words=[stemmer.stem(word.lower()) for word in s_words]

	for x in s_words:
		for i,w in enumerate(words):
			if w==x:
				bag[i]=1
	return numpy.array(bag).reshape(-1,len(bag))
def chatbot_check(message,d):

	results=model.predict([bag_of_words(message,words)])[0]

	'''with open('chatbot.pb','wb') as f:
								pickle.dump(model,f)'''
	results_idx=numpy.argmax(results)

	if results[results_idx]>0.3:

		tag=labels[results_idx]
		with open(os.path.join(os.path.dirname(__file__),'intents.json')) as file:
			print('loaded')
			data=json.load(file)


		for trunc in data['intents']:
			if trunc['tag']==tag:
				responses=trunc['responses']
				prefix=trunc['response_pre_string']
				suffix=trunc['response_post_string']
		d.append(tag)
		if(len(d)==3):
			try:
				data=mode(d)
			except:
				data=d[0]
			return "Prelimnary tests reveals that you might have "+data+".Please note that these results are only based on the symptoms you specified and may not be accurate. Consult a doctor for confirmation.",d
		else:
			return "Symptom "+message+ " noted. Would you like to add something else?",d
	else:
		return ('Did not comprehend.Please try again')
# def chat():
# 	i=0
# 	import random
# 	print('Please describe the symptoms of your skin disease  ')
# 	diseases=[]
# 	while i in range(0,3):
# 		if i!=0:
# 			print('Would you like to add something else?')
# 		inp=input()
# 		if inp.lower()=='quit':
# 			break
# 		results=model.predict([bag_of_words(inp,words)])[0]
# 		'''with open('chatbot.pb','wb') as f:
# 									pickle.dump(model,f)'''
# 		results_idx=numpy.argmax(results)
#
# 		if results[results_idx]>0.3:
#
# 			tag=labels[results_idx]
# 			with open('intents.json') as file:
# 				data=json.load(file)
#
#
# 			for trunc in data['intents']:
# 				if trunc['tag']==tag:
# 					responses=trunc['responses']
# 					prefix=trunc['response_pre_string']
# 					suffix=trunc['response_post_string']
#
# 			i+=1
# 			diseases.append(tag)
#
#
# 			#print(tts(txt))
# 		else: print('Did not comprehend.Try again')
#
# 	try:
# 		return mode(diseases)
# 	except:
# 		return diseases[0]
