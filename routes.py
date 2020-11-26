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
	notifications_count,notifications=show_notifications()
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

			return "Predicted tumor size is :<b>"+str(tumor_size(send))+" mm</b>."
		if request.form['submit']=="predict_cancer":
			res=predict_cancer(upload_file(request.files['file1']),request.form['affected_area'])

			if res['prediction']=="POSITIVE":
				return "<div ><img src='./static/uploads/"+res['path']+"' class='w-50 rounded mx-auto d-block' alt='...'></div>Prelimnary tests reveal that the image you uploaded is <b>IDENTIFIED</b> as a skin tumor. <br><b>Confidence of prediction: "+res['probability']+"</b><br>To proceed with the test click the button below.<br><div class='text-center'><button name='path' class='btn btn-success btn-round' value='"+res['path']+"' id='force_check'>Proceed</button></div>"
			else:
				return "<div ><img src='./static/uploads/"+res['path']+"' class='w-50 rounded mx-auto d-block' alt='...'></div>Prelimnary tests reveal that the image you uploaded is <b>NOT IDENTIFIED</b> as a skin tumor. <br><b>Confidence of prediction: "+res['probability']+"</b><br> If you still want to proceed with the test click the button below.<br><div class='text-center'><button name='path' class='btn btn-success btn-round' value='"+res['path']+"' id='force_check'>Proceed</button></div>"
		if request.form['submit']=="force_check":
			res2=predict_malig_type(request.form['path'])
			return "<div ><img src='./static/uploads/output/"+res2['path']+"' class='w-50 rounded mx-auto d-block' alt='...'></div>Prelimnary tests reveal that the type of skin cancer identified is <b class='text-uppercase'>"+res2['type']+"</b> and the chances of it being malignant are <b>"+res2['probability']+"%</b>."
	reports,area=show_history()
	return render_template('pathology.html',page=page,title=title,user=user,reports=reports,area=area,notifications_count=notifications_count,notifications=notifications)

@app.route("/doctors" , methods=['GET' , 'POST'])
def doctors_page():
	title="Doctors | Skin Cancer Detection"
	page="Doctors"
	user="Not Logged In"
	notifications_count,notifications=show_notifications()
	if 'user_id' not in session:
		return redirect(url_for('dashboard_page'))
	else:
		user=session['user_name']
	doctors,details,department,qualification,hospital=show_doctors()
	return render_template('doctors.html',title=title,page=page,user=user,doctors=doctors,details=details,department=department,qualification=qualification,hospital=hospital,notifications_count=notifications_count,notifications=notifications)


@app.route("/appointments" , methods=['GET' , 'POST'])
def appointments_page():
	title="Appointments | Skin Cancer Detection"
	page="Appointments"
	user="Not Logged In"
	notifications_count,notifications=show_notifications()
	if 'user_id' not in session:
		return redirect(url_for('dashboard_page'))
	else:
		user=session['user_name']
	if 'close_appointment' in request.args:
		if close_appointment(request.args):
			msg="Appointment Closed."
			flash(msg,"success")
		else:
			msg="Error."
			flash(msg,"danger")
	data=show_appointments()
	return render_template('appointments.html',title=title,page=page,user=user,data=data,notifications_count=notifications_count,notifications=notifications)

@app.route("/prescribe" , methods=['GET' , 'POST'])
def prescribe_page():
	if session['user_role']!=2:
		return redirect(url_for('dashboard_page'))
	title="Prescription | Skin Cancer Detection"
	page="Prescription"
	user="Not Logged In"
	notifications_count,notifications=show_notifications()
	if 'user_id' not in session:
		return redirect(url_for('dashboard_page'))
	else:
		user=session['user_name']
	if 'pres_desc' in request.form:
		print(request.form['pres_desc'])
		data=write_prescription(request.args,request.form)
		if data:
			msg="Prescription updated."
			flash(msg,"success")
		else:
			msg="Error Updating."
			flash(msg,"success")
	user_data,data,area=show_prescription(request.args)
	return render_template('prescribe.html',title=title,page=page,user=user,data=data,user_data=user_data,area=area,gender={'M':"Male",'F':"Female"},notifications_count=notifications_count,notifications=notifications)


@app.route("/book_appointment" , methods=['GET' , 'POST'])
def book_appointment_page():
	title="Appointment | Skin Cancer Detection"
	page="Appointment"
	user="Not Logged In"
	notifications_count,notifications=show_notifications()
	if 'user_id' not in session:
		return redirect(url_for('dashboard_page'))
	else:
		user=session['user_name']
	if('pres_id' not in request.args):
		reports,area=show_history()
		msg="Please select a prescription."
		flash(msg,"info")
		return render_template('book.html',title=title,page=page,user=user,doc=1,reports=reports,area=area,doctor=request.args['doctor_id'],notifications_count=notifications_count,notifications=notifications)
	elif('doctor_id' not in request.args):
		doctors,details,department,qualification,hospital=show_doctors()
		msg="Please select a doctor."
		flash(msg,"info")
		return render_template('book.html',title=title,page=page,user=user,doctors=doctors,details=details,department=department,qualification=qualification,hospital=hospital,doc=0,pres=request.args['pres_id'],notifications_count=notifications_count,notifications=notifications)
	elif 'time' not in request.args:
		return render_template('book.html',title=title,page=page,user=user,doctor=request.args['doctor_id'],doc=2,pres=request.args['pres_id'],notifications_count=notifications_count,notifications=notifications)
	else:
		book_appointment(request.args);
		msg="Appointment Booked."
		flash(msg,"success")
		return redirect(url_for('appointments_page'))

@app.route("/report2" , methods=['GET' , 'POST'])
def report_page():
	title="Report | Skin Cancer Detection"
	app_id=0
	if 'pres_id' in request.args:
		user_data,data,area=get_report(request.args['pres_id'])
	elif 'app_id' in request.args:
		app_id=1
		user_data,data,area=get_report(0,request.args['app_id'])
	rendered=render_template('report.html',title=title,user_data=user_data,data=data,area=area,gender={'M':"Male",'F':"Female"},app_id=app_id)
	return render_pdf(HTML(string=rendered))

@app.route("/report" , methods=['GET' , 'POST'])
def report2_page():
	title="Report | Skin Cancer Detection"
	app_id=0
	if 'pres_id' in request.args:
		user_data,data,area=get_report(request.args['pres_id'])
	elif 'app_id' in request.args:
		app_id=1
		user_data,data,area=get_report(0,request.args['app_id'])
	return render_template('report.html',title=title,user_data=user_data,data=data,area=area,gender={'M':"Male",'F':"Female"},app_id=app_id)

@app.route("/user" , methods=['GET' , 'POST'])
def user_page():
	title="User Profile | Skin Cancer Detection"
	page="User Profile"
	user="Not Logged In"
	notifications_count,notifications=show_notifications()
	if 'user_id' not in session:
		return redirect(url_for('dashboard_page'))
	else:
		user=session['user_name']
	return render_template('user.html', title=title, user=user , page=page,notifications_count=notifications_count,notifications=notifications)

@app.route("/blog" , methods=['GET' , 'POST'])
def blog_page():
	title="Blog | Skin Cancer Detection"
	page="Blog"
	user="Not Logged In"
	notifications_count,notifications=show_notifications()
	d=-1
	if 'user_id' not in session:
		return redirect(url_for('dashboard_page'))
	else:
		user=session['user_name']
	if 'post' in request.args:
		d=create_post(request.form,0)
	elif 'link' in request.args:
		d=create_post(request.form,1)
	elif 'image' in request.args:
		image=upload_file(request.files['image'])
		d=create_post(request.form,2,image)
	if d==1:
		msg="Post Created."
		flash(msg,"success")
	elif d==0:
		msg="Error in post creation."
		flash(msg,"danger")

	data=show_blogs()
	return render_template('blog.html', title=title, user=user , page=page,notifications_count=notifications_count,notifications=notifications,data=data)

@app.route("/show_blog" , methods=['GET' , 'POST'])
def show_post_page():
	if 'id' in request.args:
		data,comment,user_data=show_post(request.args['id'])
		return render_template('post.html',data=data,comment=comment,user_data=user_data)
	elif 'post_comment' in request.args:
		data=post_comment(request.form)
	elif 'upvote_comment' in request.args:
		data=react_comment(request.form,1)
	elif 'downvote_comment' in request.args:
		data=react_comment(request.form,2)
	elif 'upvote_blog' in request.args:
		data=react_blog(request.form,1)
	elif 'downvote_blog' in request.args:
		data=react_blog(request.form,2)
	if data:
		data,comment,user_data=show_post(request.form['blog_id'])
		return render_template('post.html',data=data,comment=comment,user_data=user_data)

@app.route("/chat" , methods=['GET' , 'POST'])
def chat_page():
	if 'diseases' not in session:
		session['diseases']=[]
	elif len(session['diseases'])==3:
		session['diseases']=[]
	if 'message' in request.args:
		data,session['diseases']=chatbot_check(request.form['message'],session['diseases'])
		return data
