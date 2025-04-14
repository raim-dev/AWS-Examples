## Create bucket

aws s3 mb s3://cors-examplepro01

## Set up block public access

``` sh
aws s3api put-public-access-block \
    --bucket cors-examplepro01 \
    --public-access-block-configuration \
        "BlockPublicAcls=true,\
         IgnorePublicAcls=true,\
         BlockPublicPolicy=false,\
         RestrictPublicBuckets=false"
```
## Create a bucket policy

``` sh
aws s3api put-bucket-policy --bucket cors-examplepro01 --policy file://bucket-policy.json

```

## Applies static website configuration 

``` sh
    aws s3api put-bucket-website --bucket cors-examplepro01 --website-configuration file://website.json

```

## Upload index.html file and include a resource that would be cross-origin

```sh
    aws s3 cp index.html s3://cors-examplepro01
```

## Get enpoinnt site url

http://cors-examplepro01.s3-website-us-east-1.amazonaws.com/

## Create API Gateway with mock response and test response

``` sh
curl -X POST -H "Content-Type: application/json" https://0z6jkx42b2.execute-api.us-east-1.amazonaws.com/prod/hello
```
## set cors in our bucket
``` sh
aws s3api put-bucket-cors --bucket cors-examplepro01 --cors-configuration file://cors.json
