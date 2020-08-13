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
def dashboard_page():
	title="Skin Cancer Detection"
	page="Dashboard"
	if 'user_id' not in session:
		user="Not Logged In"
	else:
		user=session['user_name']
	return(render_template("index.html",title=title,page=page,user=user))


@app.route("/login" , methods=['GET' , 'POST'])
def login_page():
	title="Login | Skin Cancer Detection"
	page="Login"
	user="Not Logged In"
	err=0
	dologin = -1
	if 'login' in session:
		dologin=session['login']
		session.pop('login',None)
	elif 'user_id' in session:
		return redirect(url_for('dashboard_page'))
	elif request.method == 'POST':
		email=request.form['email']
		password=request.form['password']
		dologin = login(email , password)
		if dologin == 1:
			msg="Login Successful"
			flash(msg,"success")
			return redirect(url_for('dashboard_page'))
		elif dologin ==0:
			msg="Incorrect Username/Password"
			flash(msg,"danger")
		elif dologin == 2:
			msg="Email does not exist please SignUp to continue."
			flash(msg,"warning")
		elif dologin == 3:
			msg="User not verified."
	if dologin == 4:
		msg="Account created.Please LogIn to continue."
		flash(msg,"success")
	return render_template('login-page.html',title=title,page=page,login=dologin,user=user)


@app.route("/signup" , methods=['GET' , 'POST'])
def signup_page():
    title="SignUp | Skin Cancer Detection"
    page="SignUp"
    user="Not Logged In"
    if 'user_id' in session:
        return redirect(url_for('dashboard_page'))
    elif request.method == 'POST':
        name = request.form['name']
        password = request.form['password']
        email = request.form['email']
        dob = request.form['dob']
        gender = request.form['gender']
        password = crypt_password(password)
        if signup(name,password,email,dob,gender):
            session['login']=4
            return redirect(url_for('login_page'))
    return render_template('signup-page.html',title=title,page=page,user=user)


@app.route("/logout")
def logout_page():
	if(logout()):
		return redirect(url_for('login_page'))
	return redirect(url_for('dashboard_page'))


@app.route("/pathology",methods=['GET','POST'])
def pathology_page():
	title="Pathology | Skin Cancer Detection"
	page="Pathology"
	if 'user_id' not in session:
		redirect(url_for('login_page'))
	else:
		user=session['user_name']
	if request.method == 'POST':
		if request.form['submit']=="tumor_size":
			send=[];
			send.append(float(request.form['mass']))
			send.append(float(request.form['size']))
			send.append(float(request.form['mratio']))
			send.append(float(request.form['dsize']))
			send.append(float(request.form['exparea']))
			if 'checkbox' in request.form:
				send.append(126.1385)
				send.append(3846.32)
				send.append(54)
			else:
				send.append(float(request.form['std_dev']))
				send.append(float(request.form['merror']))
				send.append(float(request.form['mpenalty']))
			send.append(float(request.form['dratio']))

			return "Predicted tumor size is :<b>"+str(tumor_size(send))+"</b>."
		if request.form['submit']=="predict_cancer":
			res=predict_cancer(upload_file(request.files['file1']))
			if res['prediction']=="POSITIVE":
				res2=predict_malig_type(res['path'])
				return "Prelimnary tests reveal that the type of skin cancer identified is <b class='text-uppercase'>"+res2['type']+"</b> and the chances of it being malignant are <b>"+res2['probability']+"%</b>."
			else:
				return "Prelimnary tests reveal that the image you uploaded is <b>NOT IDENTIFIED</b> as a skin tumor. <br><b>Confidence of prediction: "+res['probability']+"</b><br> If you still want to proceed with the test click the button below.<br><div class='text-center'><button name='path' class='btn btn-primary btn-round' value='"+res['path']+"' id='force_check'>Proceed</button></div>"
		if request.form['submit']=="force_check":
			res2=predict_malig_type(request.form['path'])
			return "Prelimnary tests reveal that the type of skin cancer identified is <b class='text-uppercase'>"+res2['type']+"</b> and the chances of it being malignant are <b>"+res2['probability']+"%</b>."
	return render_template('pathology.html',page=page,title=title,user=user)
