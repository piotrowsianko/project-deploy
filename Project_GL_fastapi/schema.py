from pydantic import BaseModel

class CreateItem(BaseModel):
    name: str
    id: int
    count: int

    class Config:
        orm_mode = True