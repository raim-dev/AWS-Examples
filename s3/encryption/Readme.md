## Create bucket
aws s3 mb s3://ecryptionpro01

## upload file

echo "Hello world" > hello.txt
aws s3 cp hello.txt s3://ecryptionpro01

## put file SSE-C (encryption on clientSide)

```sh
export BASE64_ENCODED_KEY = $(openssl rand 32 | base64)

echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo -n $BASE64_ENCODED_KEY | base64 --decode | md5sum | awk '{print $1}' | base64)

echo MD5_VALUE

```

### put object with SSE-C via s3

## generate key
 > openssl rand -out ssec.key 32

## upload
aws s3 cp hello.txt s3://ecryptionpro01 --sse-c AES256 --sse-c-key fileb://ssec.key

## download
aws s3 cp s3://ecryptionpro01/hello.txt hello.txt --sse-c AES256 --sse-c-key fileb://ssec.key


### Encryption client-side SDK with Ruby


> bundle exec ruby encrypt.rb





