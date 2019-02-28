import datetime
import pytz
from sqlalchemy.orm import relationship, backref
from sqlalchemy import Boolean, DateTime, Date, Column, Integer, String, Text, Float, ForeignKey, LargeBinary
from flask_sqlalchemy import SQLAlchemy
from dateutil import relativedelta

db = SQLAlchemy()

eastern = pytz.timezone("America/New_York")

class AuthorPublication(db.Model):
	__tablename__ = "AuthorPublication"
	
	id = Column("idAuthorPublication", Integer(), primary_key=True, nullable=False)
	author = Column("author", Integer(), ForeignKey("Author.idAuthor"), nullable=False)
	publication = Column("publication", Integer(), ForeignKey("Publication.idPublication"), nullable=False)
	author_order = Column("authorOrder", Integer())

class Publication(db.Model):
	__tablename__ = "Publication"
	
	id = Column("idPublication", Integer(), primary_key=True, nullable=False)
	title = Column("title", String(255), nullable=False)
	conference = Column("conference", Integer(), ForeignKey("Conference.idConference"), nullable=False)
	pdf_link = Column("pdfLink", String(255))
	slide_link = Column("slideLink", String(255))
	web_source = Column("webSource", String(255))
	web_link = Column("webLink", String(255))
	
	def getSerializable(self, desired_cols=None):
		json_obj = {}
		
		if desired_cols == None or "id" in desired_cols:
			json_obj["publicationId"] = self.id
		if desired_cols == None or "title" in desired_cols:
			json_obj["publicationTitle"] = self.title
		if desired_cols == None or "pdfLink" in desired_cols:
			json_obj["publicationPdfLink"] = self.pdf_link
		if desired_cols == None or "slideLink" in desired_cols:
			json_obj["publicationSlideLink"] = self.slide_link
		if desired_cols == None or "webSource" in desired_cols:
			json_obj["publicationWebSource"] = self.web_source
		if desired_cols == None or "webLink" in desired_cols:
			json_obj["publicationWebLink"] = self.web_link
		
		return json_obj
	
class Conference(db.Model):
	__tablename__ = "Conference"
	
	id = Column("idConference", Integer(), primary_key=True, nullable=False)
	platform  = Column("platform", Integer(), ForeignKey("Platform.idPlatform"), nullable=False)
	acceptance = Column("acceptance", Float())
	country = Column("country", String(255), nullable=False)
	state = Column("state", String(255)),
	city = Column("city", String(255), nullable=False)
	start_date = Column("startDate", Date(), nullable=False)
	end_date = Column("endDate", Date())
	
	def getSerializable(self, desired_cols=None):
		json_obj = {}
		
		if desired_cols == None or "id" in desired_cols:
			json_obj["conferenceId"] = self.id
		if desired_cols == None or "acceptance" in desired_cols:
			json_obj["conferenceAcceptance"] = self.acceptance
		if desired_cols == None or "country" in desired_cols:
			json_obj["conferenceCountry"] = self.country
		if desired_cols == None or "state" in desired_cols:
			json_obj["conferenceState"] = self.state
		if desired_cols == None or "city" in desired_cols:
			json_obj["conferenceCity"] = self.city
		if desired_cols == None or "startDate" in desired_cols:
			json_obj["conferenceStartDate"] = self.start_date
		if desired_cols == None or "endDate" in desired_cols:
			json_obj["conferenceEndDate"] = self.end_date
		
		return json_obj
	
class Platform(db.Model):
	__tablename__ = "Platform"

	id = Column("idPlatform", Integer(), primary_key=True, nullable=False)
	title = Column("title", String(255))
	abreviation = Column("abreviation", String(255))
	impact_factor = Column("impactFactor", Float())
	
	def getSerializable(self, desired_cols=None):
		json_obj = {}
	
		if desired_cols == None or "id" in desired_cols:
			json_obj["platformId"] = self.id
		if desired_cols == None or "title" in desired_cols:
			json_obj["platformTitle"] = self.title
		if desired_cols == None or "abrevation" in desired_cols:
			json_obj["platformAbrevation"] = self.abreviation
		if desired_cols == None or "impactFactor":
			json_obj["platformImpactFactor"] = self.impact_factor
			
		return json_obj
	
class Author(db.Model):
	__tablename__ = "Author"

	id = Column("idAuthor", Integer(), primary_key=True, nullable=False)
	first_name = Column("firstName", String(255))
	middle_name = Column("middleName", String(255))
	last_name = Column("lastName", String(255))
	website = Column("website", String(255))
	
	def getSerializable(self, desired_cols=None):
		json_obj = {}
	
		if desired_cols == None or "id" in desired_cols:
			json_obj["authorId"] = self.id
		if desired_cols == None or "firstName" in desired_cols:
			json_obj["authorFirstName"] = self.first_name
		if desired_cols == None or "middleName" in desired_cols:
			json_obj["authorMiddleName"] = self.middle_name
		if desired_cols == None or "lastName" in desired_cols:
			json_obj["authorLastName"] = self.last_name
		if desired_cols == None or "authorWebsite" in desired_cols:
			json_obj["authorWebsite"] = self.website
			
		return json_obj
