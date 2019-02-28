import pymysql
import datetime

tables = ["AuthorPublication", "Publication", "Conference", "Platform", "Author"]

create_author_table = """CREATE TABLE Author (idAuthor INT NOT NULL AUTO_INCREMENT,
							firstName VARCHAR(255),
							middleName VARCHAR(255),
							lastName VARCHAR(255),
							website VARCHAR(255),
							
							PRIMARY KEY (idAuthor) );"""
	
create_platform = """CREATE TABLE Platform (idPlatform INT NOT NULL AUTO_INCREMENT,
						title VARCHAR(255) NOT NULL,
						impactFactor FLOAT,
						
						PRIMARY KEY (idPlatform) );"""
						
create_conference = """CREATE TABLE Conference (idConference INT NOT NULL AUTO_INCREMENT,
							platform INT NOT NULL,
							acceptance FLOAT,
							country VARCHAR(255) NOT NULL,
							state VARCHAR(255),
							city VARCHAR(255) NOT NULL,
							startDate DATE NOT NULL,
							endDate DATE,
							
							PRIMARY KEY (idConference),
							FOREIGN KEY (platform) REFERENCES Platform(idPlatform) );"""
							
create_publication = """CREATE TABLE Publication (idPublication INT NOT NULL AUTO_INCREMENT,
							title VARCHAR(255) NOT NULL,
							conference INT NOT NULL,
							pdfLink VARCHAR(255),
							slideLink VARCHAR(255),
							
							PRIMARY KEY (idPublication),
							FOREIGN KEY (conference) REFERENCES Publication(idPublication) );"""
							
create_author_publication = """CREATE TABLE AuthorPublication (idAuthorPublication INT NOT NULL AUTO_INCREMENT,
								author INT NOT NULL,
								publication INT NOT NULL,
								
								PRIMARY KEY (idAuthorPublication),
								FOREIGN KEY (author) REFERENCES Author(idAuthor),
								FOREIGN KEY (publication) REFERENCES Publication(idPublication) );"""
				
def destroy_all_tables(conn, cur):
	for table in tables:
		cur.execute("DROP TABLE IF EXISTS " + table)
		conn.commit()
								
conn = pymysql.connect("localhost", "root", "super_mario", "publicationSystem")
cur = conn.cursor()
destroy_all_tables(conn, cur)

cur.execute(create_author_table)
cur.execute(create_platform)
cur.execute(create_conference)
cur.execute(create_publication)
cur.execute(create_author_publication)

conn.commit()

print "tables created"
