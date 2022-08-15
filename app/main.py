# A python application with mix of FastAPI
# that works as a shop on a Uvicorn werb server and JSON file.
from fastapi import FastAPI, Depends
import json
import pandas as pd
import numpy as np


from schema import CreateItem as CreateItem
from models import Item as Items
from database import get_db
from sqlalchemy.orm import Session

shop = FastAPI()  # Application named Shop created with FastAPI




# Main page of the web server
@shop.get("/")
async def root():
    return{"Welcome to the shop": "!"}

# Main page of the web server
@shop.get("/root")
async def root():
    return{"Welcome to the shop": "!"}


# Page to post items into database
@shop.post("/create_item")
async def create(details: CreateItem, db: Session = Depends(get_db)):
    to_create = Items(
        name = details.name,
        id = details.id,
        count = details.count
    )
    db.add(to_create)
    db.commit()
    return {
        "success": True,
        "created_id": to_create.id,
        "created_item": to_create.name,
        "created_count": to_create.count
    }

@shop.get("/get_items")
async def get(db: Session = Depends(get_db)):
    df = pd.DataFrame(db.query(Items))
    return df



@shop.delete("/delete_item/{id}/")
def delete(id: int, db: Session = Depends(get_db)):
    id = db.get(Items, id)
    if not id:
        return {"item not found" : True}
    db.delete(id)
    #db.query(Items).filter(Items.id == id).delete()
    db.commit()
    return {"success": True}
