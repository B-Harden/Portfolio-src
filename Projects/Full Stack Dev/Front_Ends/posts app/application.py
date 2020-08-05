import time
import os

from flask import Flask, jsonify, render_template, request
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask(__name__)

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/posts", methods=["POST"])
def posts():

    # Get start and end point for posts to generate.
    start = int(request.form.get("start") or 0)
    end = int(request.form.get("end") or (start + 9))

    # Generate list of posts.
    data = []
    for i in range(start, end + 1):
        data.append("Post #" + str(i))

    # Artificially delay speed of response.
    time.sleep(2)


    # # Alternatively, retrieve posts stored in a database
    # data = db.execute('SELECT * FROM comments').fetchall()
    # return data

    # Return list of posts.
    return jsonify(data)
