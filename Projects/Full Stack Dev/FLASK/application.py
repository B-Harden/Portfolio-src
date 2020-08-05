import datetime

from flask import Flask, render_template
app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/more")
def more():
    return render_template("more.html")

@app.route("/newyear")
def newyear():
    now = datetime.datetime.now()
    new_year = now.month == 1 and now.day == 1

    present = False
    return render_template("test.html", new_year= new_year, present= present)

@app.route("/names")
def names():
    names = ["Alice", "Bob", "Charlie"]
    present = True
    return render_template("test.html", names= names, present= present)

