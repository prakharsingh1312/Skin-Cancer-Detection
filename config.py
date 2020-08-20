import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
app = Flask(__name__)
app.secret_key='Popatpanda'
app.config['UPLOAD_FOLDER']=os.path.join(os.path.dirname(__file__), '/static/uploads/')
app.config['MAX_CONTENT_PATH']=1024
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://SCD:Popat#Panda#1234$@localhost/SkinCancer'
db=SQLAlchemy(app)
