#!/usr/bin/env bash

. ./aws_env_setup.sh

git submodule init && git submodule update

cat > "versitygw/tests/.secrets" <<-EOF
export AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
export AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
export AWS_ENDPOINT_URL="${AWS_ENDPOINT_URL}"
export AWS_PROFILE="${AWS_PROFILE}"
export AWS_REGION="${AWS_REGION}"
EOF

sed -i .orig -e 's|^CERT.*|CERT=/home/tester/cert-docker.pem|' \
    -e 's|^KEY.*|KEY=/home/tester/versitygw-docker.pem|' versitygw/tests/.env.default

docker-compose build
docker-compose up -d

docker-compose --profile autotest -d
#aws s3 mb s3://test
#aws s3 cp docker-compose.yml s3://test/test.yaml
