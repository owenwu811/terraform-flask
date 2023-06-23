FROM python:3.7.12-alpine

RUN mkdir /tfflaskapp
WORKDIR /tfflaskapp

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY tfflask /tfflaskapp

EXPOSE 8080

CMD ["python", "web.py"]
