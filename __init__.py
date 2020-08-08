from flask import Flask ,  render_template, request , session , redirect , url_for,flash
from functions import *
app = Flask(__name__)
@app.route("/", methods=['GET', 'POST'])
def home():
	if request.method == 'POST':
		send=[];
		send.append(float(request.form['mass']))
		send.append(float(request.form['size']))
		send.append(float(request.form['mratio']))
		send.append(float(request.form['damage']))
		send.append(float(request.form['exparea']))
		send.append(float(request.form['dratio']))
		return str(tumor_size(send))	

	return render_template("test.html")
if __name__ == "__main__":
    app.run()
