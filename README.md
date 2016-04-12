# iron-watermarker
Dockerized image watermarking script. Can run locally, or be pushed to a iron.io worker queue

This script will pull a file from a s3 bucket, watermark it, then re-upload the result to some other bucket.

[See a complete description & explanation here](https://medium.com/@aherve/dockerized-background-image-processing-with-docker-and-iron-io-workers-6bb19e797584)

## Usage

- copy `secret.env.sample` to `secret.env` and fill the file.
- create a codeship project, link-it to your repo, and copy the related `codeship.aes` key here.
- run `jet encrypt secret.env encrypted.env` and commit the resulting `encrypted.env` file
- login to dockerhub with `docker login`, then run `jet encrypt ~/.docker/config.json dockercfg.encrypted` and commit the resulting encrypted file
- edit `test/payload.json` and test locally with `jet steps`
- At each push, a codeship build will trigger, run the tests, upload the resulting docker image to dockerhub, then declare your image to your iron.io project

