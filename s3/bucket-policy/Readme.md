## Create bucket

aws s3 mb s3://policy-examplepro01

## Create bucket policy

aws s3api put-bucket-policy --bucket policy-examplepro01 --policy file://policy.json

## In the other account acess bucket

aws s3 ls s3://policy-examplepro01
touch bucket.txt
aws s3 cp bucket.txt s3://policy-examplepro01

## Cleanup

aws s3 rm s3://policy-examplepro01/*
aws s3 rb s3://policy-examplepro01