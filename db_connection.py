from models import db, Publication, Conference, Platform, Author, AuthorPublication

""" Grabs all of the relevant information for a publication including conference and authors.

"""
def get_all_publications():
	all_publications = db.session.query(Publication, Conference, Platform)\
									.filter(Publication.conference==Conference.id)\
									.filter(Conference.platform==Platform.id).all()
									
	all_publication_json = []
	for publication, conference, platform in all_publications:
		# Go ahead and grab all of the authors for this publication
		publication_authors = db.session.query(AuthorPublication, Author)\
											.filter(AuthorPublication.author==Author.id)\
											.filter(AuthorPublication.publication==publication.id).order_by(AuthorPublication.author_order).all()
		# Iterate through every author so that we can serialize in prep for sending to the webpage
		all_authors = []
		for author_pub, single_author in publication_authors:
			all_authors.append(single_author.getSerializable())
			
		publication_json = { "publication" : publication.getSerializable() }
		publication_json["authors"] = all_authors
		publication_json["conference"] = conference.getSerializable()
		publication_json["platform"] = platform.getSerializable()
		
		all_publication_json.append( publication_json )
		
	return all_publication_json
				
