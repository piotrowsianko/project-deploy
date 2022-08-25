from requests import session
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from data import url




#SQLALCHEMY_DATABASE_URL = "postgresql://"+ os.getenv['db_username']+ ":" +os.getenv['db_password']+"@"+ os.getenv['db_endpoint'] +"/postgres"
#SQLALCHEMY_DATABASE_URL = "postgresql:/$(db_username):$(db_password)@$(db_endpoint)/postgres"


#SQLALCHEMY_DATABASE_URL = "postgresql+psycopg2://postgres:password1@terraform-2022082407533712560000000b.c0zbwl7kvrhj.us-east-1.rds.amazonaws.com:5432/postgres"
SQLALCHEMY_DATABASE_URL = url


engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    except:
        db.close()