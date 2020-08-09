from functions import *
app = Flask(__name__)
app.config['UPLOAD_FOLDER']=os.path.join(os.path.dirname(__file__), '/uploads/')
app.config['MAX_CONTENT_PATH']=1024
@app.route("/", methods=['GET', 'POST'])
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