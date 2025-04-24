# Create a network ACL for the specified VPC

## get the VPC ID from a VPC name tag 
```sh
aws ec2 describe-vpcs \
 --filters "Name=tag:Name,Values=ncl-example-vpc-vpc" \
 --query "Vpcs[0].VpcId" \
 --output text

  ```


```sh
aws ec2 create-network-acl --vpc-id vpc-05d21345c5ec60911

```

## Grab the latest Amazon Linux 2 AMI ID

```sh
    aws ssm get-parameters \
  --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
  --region us-west-1 \
  --query "Parameters[0].Value" \
  --output text

```

# block inbound traffic from the IP address 172.56.241.213 using a Network ACL (NACL)
```sh
aws ec2 create-network-acl-entry \
  --network-acl-id acl-0492429944d2976c3 \
  --ingress \
  --rule-number 90 \
  --protocol -1 \
  --port-range From=0,To=65535 \
  --cidr-block 172.56.241.213/32 \
  --rule-action deny

```