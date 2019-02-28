import db_connection
from flask import Flask, render_template
from models import db

personal_website = Flask(__name__)
personal_website.config['SQLALCHEMY_DATABASE_URI'] = "mysql://root:super_mario@localhost/publicationSystem"
personal_website.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(personal_website)

@personal_website.route("/")
def homepage():
	publications = db_connection.get_all_publications()
	print publications
	
	return render_template("index.html", data={"publications" : publications})

