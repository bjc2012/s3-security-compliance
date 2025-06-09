#Python Script for Compliance Scanning. Scans for all buckets to check for Publicly accessible, Not encrypted, Missing logging

import boto3

s3 = boto3.client('s3')
buckets = s3.list_buckets()['Buckets']

for bucket in buckets:
    name = bucket['Name']
    print(f"\n🔍 Checking bucket: {name}")
    
    # 1. Check Public Access Block
    try:
        access_block = s3.get_public_access_block(Bucket=name)
        config = access_block['PublicAccessBlockConfiguration']
        if not all(config.values()):
            print(f"❌ Public access not fully blocked: {config}")
        else:
            print("✅ Public access is blocked.")
    except:
        print("❌ No public access block config found.")

    # 2. Check Encryption
    try:
        s3.get_bucket_encryption(Bucket=name)
        print("✅ Bucket is encrypted.")
    except:
        print("❌ Bucket is NOT encrypted.")

    # 3. Check Logging
    logging = s3.get_bucket_logging(Bucket=name)
    if 'LoggingEnabled' in logging:
        print("✅ Logging is enabled.")
    else:
        print("❌ Logging is NOT enabled.")
