
#!/bin/bash



#Create bucket
aws s3api create-bucket --bucket my-2025-secure-bucket  --region us-east-1


aws s3api put-bucket-versioning \
  --bucket my-2025-secure-bucket \
  --versioning-configuration Status=Enabled

#enable bucket versioning
aws s3api put-bucket-encryption \
  --bucket my-2025-secure-bucket \
  --server-side-encryption-configuration '{
    "Rules": [{
      "ApplyServerSideEncryptionByDefault": {
        "SSEAlgorithm": "AES256"
      }
    }]
  }'


#block public access on S3 bucket
aws s3api put-public-access-block \
  --bucket my-2025-secure-bucket \
  --public-access-block-configuration \
  "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

#create logging bucket
aws s3api create-bucket --bucket my-2025-logging-bucket --region us-east-1

#enable logging on the secure S3 bucket
aws s3api put-bucket-logging \
  --bucket my-2025-secure-bucket \
  --bucket-logging-status '{
    "LoggingEnabled": {
      "TargetBucket": "my-2025-logging-bucket",
      "TargetPrefix": "devsecops-logs/"
    }
  }'
