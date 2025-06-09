# 🛡️ S3 Security Compliance Check with AWS CLI + Python

This mini Cloud security project creates a secure S3 bucket setup and uses a Python script to check for misconfigured S3 buckets.

## 🚀 What It Does

- Creates an S3 bucket with:
  - Versioning
  - Server-side encryption (AES256)
  - Blocked public access
  - Logging enabled

- Python script scans all buckets and reports:
  - If public access is blocked
  - If encryption is enabled
  - If logging is enabled

## 🧰 Files

- `setup_s3_buckets.sh` — Automates the S3 bucket creation and setup
- `check_s3_compliance.py` — Python script to scan and report on compliance

## ✅ Requirements

- AWS CLI configured
- Python 3
- Boto3 library (`pip install boto3`)

## 📦 To Use

```bash
# Set up buckets
./setup_s3_buckets.sh

# Run compliance check
python3 check_s3_compliance.py

