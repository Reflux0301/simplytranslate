FROM golang:1.20-alpine

RUN apk add --no-cache git 

RUN git clone "https://codeberg.org/ManeraKai/simplytranslate.git" /root/simplytranslate

WORKDIR /root/simplytranslate/web/
RUN go mod download
RUN go build -o simplytranslate
EXPOSE 5000
CMD [ "./simplytranslate" ]