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
			flash(msg,"warning")
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
        password = crypt_password(password)
        if signup(name,password,email):
            session['login']=3
            return redirect(url_for('login_page'))
    return render_template('signup-page.html',title=title,page=page,user=user)