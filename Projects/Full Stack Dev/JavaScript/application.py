import os

import requests

# from models import *
from flask import Flask, render_template, request, jsonify
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask(__name__)

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))


# Home page
@app.route("/")
def index():
    flights = db.execute("SELECT * FROM flights").fetchall()
    return render_template("index.html", flights=flights)


# Book flight and return confirmation.
@app.route("/book", methods=["POST"])
def book():
    """Book a flight."""

    # Get form information.
    name = request.form.get("name")
    try:
        flight_id = int(request.form.get("flight_id"))
    except ValueError:
        return  jsonify({'error': "Flight does not exist."})
        # render_template("error.html", message="Invalid flight number.")

    # Make sure flight exists.
    if db.execute("SELECT * FROM flights WHERE id = :id", {"id": flight_id}).rowcount == 0:
        return render_template("error.html", message="No such flight with id: " + str(flight_id))
    db.execute("INSERT INTO passengers (name, flight_id) VALUES (:name, :flight_id)",
                {"name": name, "flight_id": flight_id})
    db.commit()
    return render_template("success.html", flight_id= flight_id)


# Makes request to flight_info api to retrieve flight's info
@app.route('/flight_info', methods=['POST', 'GET'])
def flight_info():
    flight_id = request.form.get("flight_id")
    res = requests.get("http://127.0.0.1:5000/api/flight_info", params= {'flight_id': flight_id})

    if res.status_code != 200:
        return jsonify({"success": False})

    data = res.json()
    return jsonify({
        'success': True,
        'origin': data['origin'],
        'destination': data['destination'],
        'duration': data['duration']
        })


# API that returns flight's info.
@app.route('/api/flight_info', methods= ['GET', 'POST'])
def api_flight_info():

    if 'flight_id' in request.args:
        flight_id = int(request.args['flight_id'])
    else:
        return "Error: No flight_id provided. Please specify an flight_id."

    # Query for flight info.
    flight_info = db.execute("SELECT * FROM flights WHERE id= :id", {'id': flight_id}).fetchone()

    return jsonify({
        'flight_id': flight_info.id,
        "origin": flight_info.origin,
        'destination': flight_info.destination,
        'duration': flight_info.duration
    })
