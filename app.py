from flask import Flask, request, render_template, send_file
import urllib.request, os, random

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/", methods=["POST"])
def download():
    Identifier = str(random.randint(1, 900000))
    os.system(f"ruby request.rb")
    url = open("test.txt", "r").read()
    urllib.request.urlretrieve(request.form["download"], f'{Identifier}_.mp4')
   

if __name__ == "__main__" :
    app.run(debug=True, host="0.0.0.0")