import sys
from flask import Flask
app = Flask(__name__)

@app.route('/')
def get_path():
    return str(sys.path)
