export AWS_SECRET_ACCESS_KEY=password
export AWS_ACCESS_KEY_ID=user
export AWS_ENDPOINT_URL=http://127.0.0.1:7070
export AWS_REGION=us-east-1

aws s3 mb s3://test
aws s3 cp docker-compose.yml s3://test/test.yaml
