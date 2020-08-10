from functions import *
@app.route("/test", methods=['GET', 'POST'])
def home():
	if request.method == 'POST':
		if request.form['submit']=="tumor_size":
			send=[];
			send.append(float(request.form['mass']))
			send.append(float(request.form['size']))
			send.append(float(request.form['mratio']))
			send.append(float(request.form['damage']))
			send.append(float(request.form['exparea']))
			send.append(float(request.form['dratio']))
			return str(tumor_size(send))
		if request.form['submit']=="predict_cancer":
			return predict_cancer(upload_file(request.files['image']))

	return render_template("test.html")
@app.route("/",methods=['GET', 'POST'])
def dash():
	title="Skin Cancer Detection"
	page="Skin Cancer Detection"
	user="Not Logged In"
	return(render_template("index.html",title=title,page=page,user=user ))
