from requests import session
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
#import os


#SQLALCHEMY_DATABASE_URL = "postgresql://"+ os.environ['db_username']+ ":" +os.environ['db_password']+"@"+ os.environ['db_endpoint'] +"/postgres"
SQLALCHEMY_DATABASE_URL = "postgresql:/$(db_username):$(db_password)@$(db_endpoint)/postgres"
#SQLALCHEMY_DATABASE_URL = "postgresql://postgres:password@terraform-2022081511444916190000000b.cyiv2s4yjhem.us-east-1.rds.amazonaws.com:5432/postgres"


engine = create_engine(SQLALCHEMY_DATABASE_URL)
connection = engine.connect()
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try: 
        yield db
    except:
        db.close()

        