#########  READ ENV VARIABLES ###########
echo "reading env variables"
eval `./jsonenv.py < $PAYLOAD_FILE`
eval `./jsonenv.py < $CONFIG_FILE`

#########  DOWNLOAD FILE ###########
echo "downloading"
aws s3 cp s3://$S3_INPUT_BUCKET/$S3_INPUT_DIRNAME/$S3_INPUT_FILENAME ./orig.pdf

############  CONVERT FILE   #######
echo "converting file"

convert -density 100 ./orig.pdf \
  -fill "rgba(0,0,0,0.1)" \
  -pointsize 40 \
  -gravity center -draw "rotate -30 text 5,0 'CONFIDENTIEL HUNTEED'" \
  -gravity center -draw "rotate -30 text 5,60 '$WATERMARK_TEXT'" \
  ./result.pdf

############  REUPLOAD   ###########
echo "uploading"

aws s3 cp ./result.pdf s3://$S3_DEST_BUCKET/$S3_DEST_DIRNAME/$S3_DEST_FILENAME
