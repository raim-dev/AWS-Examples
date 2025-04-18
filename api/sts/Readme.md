### Create user with no permition

We need to create a new user with no permissions and generate access keys

```sh
aws iam create-user --user-name sts-machine-user

aws iam create-access-key --user-name sts-machine-user --output table

```

configure credentais file

```sh
aws configure

open ~/.aws/credentials

aws s3 ls --profile sts 

```
> An error occurred (AccessDenied) when calling the ListBuckets operation: User: arn:aws:iam::785905900872:user/sts-machine-user is not authorized to perform: s3:ListAllMyBuckets because no identity-based policy allows the s3:ListAllMyBuckets action

check profile
```sh
 aws sts get-caller-identity --profile sts
```

## Create a Role

We need to create a role that will access a new resource

## Use new user credentials and assume role

add user policy assume role

```sh
aws iam put-user-policy \
    --user-name sts-machine-user \
    --policy-name StsAssumePolicy \
    --policy-document file://bin/policy.json
```



```sh
aws sts assume-role \
    --role-arn  arn:aws:iam::785905900872:role/my-sts-stack-example-StsRole-aB3UvIA6pjnB \
    --role-session-name s3-access-examplepro --profile sts
```

## cleanup

```sh
aws iam delete-access-key --access-key-id AKIA3N65ELVELYTVYZNX --user-name sts-machine-user 


aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy


aws iam delete-user --user-name sts-machine-user

aws aws cloudformation delete-stack --stack-name my-sts-stack-example

```



