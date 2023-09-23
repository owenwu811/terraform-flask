FROM python:3.7-alpine #choosing a lightweight base image to build ontop of instead of a full blown operating system helps reduce image size 
RUN mkdir /tfflaskapp
WORKDIR /tfflaskapp
COPY ./tfflask /tfflaskapp
RUN apk update && apk upgrade
RUN pip3 install -r requirements.txt
RUN apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    rm -rf /root/.cacheENV FLASK_ENV=production
ENV APP_CONFIG=config.production
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s \ 
    CMD wget -q --spider http://localhost:8080/ || exit 1
CMD ["python3","web.py"]
