FROM python:alpine

RUN apk add --no-cache git libxml2 libxml2-dev libxslt-dev musl-dev gcc

RUN git clone "https://codeberg.org/SimpleWeb/SimplyTranslate-Engines" engines && \
    git clone "https://codeberg.org/SimpleWeb/SimplyTranslate-Web" web

WORKDIR /engines
RUN python3 setup.py install && \
    pip install -r requirements.txt
WORKDIR /web
RUN pip install -r requirements.txt

COPY web.conf /etc/simplytranslate/web.conf

EXPOSE 5000
CMD ["python3", "main.py"]