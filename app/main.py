import datetime
import socket
import uuid

from typing import Union

from fastapi import FastAPI
from pydantic import BaseModel


class IndexResponse(BaseModel):
    message: str
    timestamp: str


class HealthCheckResponse(BaseModel):
    timestamp: str
    hostname: str
    health: str


class UuidResponse(BaseModel):
    uuid: str


app = FastAPI()


@app.get("/")
def index() -> IndexResponse:
    return IndexResponse(
        message="Hello world!",
        timestamp=datetime.datetime.now(tz=datetime.UTC).isoformat()
    )


@app.get("/health")
def health_check() -> HealthCheckResponse:
    return HealthCheckResponse(
        timestamp=datetime.datetime.now(tz=datetime.UTC).isoformat(),
        hostname=socket.gethostname(),
        health="good"
    )


@app.get("/uuids/new")
def create_uuid() -> UuidResponse:
    return UuidResponse(uuid=str(uuid.uuid4()))