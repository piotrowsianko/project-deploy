from sqlalchemy import Integer, String
from sqlalchemy.sql.schema import Column
from database import Base

class Item(Base):
    __tablename__ = "Items"

    id = Column(Integer, primary_key=True, index = True)
    name = Column(String, nullable=False)
    count = Column(Integer)
