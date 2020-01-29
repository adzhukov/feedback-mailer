FROM python:3.8-slim-buster
COPY app.py limited_dict.py requirements.txt /app/
WORKDIR /app
RUN pip install -r requirements.txt
CMD python ./app.py

