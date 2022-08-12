from requests import session
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os


SQLALCHEMY_DATABASE_URL = "postgresql://postgres:password@"+ os.environ['db_endpoint'] +"/postgres"

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

        