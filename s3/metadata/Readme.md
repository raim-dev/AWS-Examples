## Create a bucket

aws s3 mb s3://metadata-examplepro01

### Create new file
echo "Hello Mars" > hello.txt

## upload file with metadata

aws s3api put-object --bucket metadata-examplepro01 --key hello.txt --body hello.txt --metadata Planet=Mars

## Get Metadata through head object

aws s3api head-object --bucket metadata-examplepro01 --key hello.txt