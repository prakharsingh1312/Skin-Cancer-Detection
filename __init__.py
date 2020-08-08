from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "Base App Running"
if __name__ == "__main__":
    app.run()
