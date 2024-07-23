from typing import Union

import uvicorn
from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware


class Data(BaseModel):
    name: str


app = FastAPI()

origins = [
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/api/get_data")
def read_root():
    return {"Hello": "World"}


@app.post("/api/post_data")
def post_data(data: Data):
    data.name += " mew"
    return data


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
