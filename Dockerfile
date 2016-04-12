FROM alpine

RUN mkdir /app
WORKDIR /app

RUN apk update && \
  apk add imagemagick python ghostscript-fonts ghostscript py-pip groff && \
  pip install awscli

ADD work.sh .
ADD jsonenv.py .

ENTRYPOINT ./work.sh
