FROM python:3.9.17-slim

WORKDIR /app

RUN apt update
RUN apt install gcc python3-dev -y

COPY ["pyproject.toml", "poetry.lock", "./"]
COPY ["./05-deployment/model_C=1.0.bin","./05-deployment/train.py", "./05-deployment/predict.py", "./"]


RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-root

EXPOSE 9696

ENTRYPOINT [ "gunicorn" ,"--bind=0.0.0.0:9696" ,"predict:app" ]

# RUN gunicorn --bind=0.0.0.0:6969 predict:app