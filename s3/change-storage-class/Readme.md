## Create a bucket

aws s3 mb s3://changeclassexamplepro01

## create file

echo > "Hello World" > hello.txt

aws s3 cp hello.txt s3://changeclassexamplepro01

aws s3 cp hello.txt s3://changeclassexamplepro01 --storage-class STANDARD_IA

## Cleanup
aws s3 rm s3://changeclassexamplepro01/hello.txt
aws s3 rb s3://changeclassexamplepro01