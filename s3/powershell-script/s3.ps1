Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt 'Enter the s3 name'

Write-Host "AWS Region: $region"
Write-Host "AWS Bucket: $bucketName"

function BucketExist {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if(-not (BucketExist)){
    Write-Host "Bucket does not exist"
    New-S3Bucket -BucketName $bucketName -Region $region
}else{
    Write-Host "Bucket already exists..."
}



#Create a ew file
$fileName = 'myfile.txt'
$fileContent = 'Hello World'

Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName