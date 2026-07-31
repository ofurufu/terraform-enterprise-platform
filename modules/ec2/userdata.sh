#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y nginx amazon-cloudwatch-agent amazon-ssm-agent

systemctl enable --now amazon-ssm-agent
systemctl enable --now nginx

cat > /usr/share/nginx/html/index.html <<EOF
<h1>Ofuru Application Server</h1>
<p>Provisioned with Terraform</p>
EOF