#!/bin/bash
set -euxo pipefail

# Log everything for troubleshooting
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

echo "========== User Data Started =========="
date

# Update packages
dnf update -y

# Install Nginx
dnf install -y nginx

# Create custom web page
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Ofuru Enterprise Platform</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background:#0b1320;
            color:white;
            text-align:center;
            margin-top:100px;
        }
        h1{
            color:#00d084;
        }
    </style>
</head>

<body>

<h1>Ofurufu Terraform Deployment Successful</h1>

<h2>Enterprise Infrastructure Platform</h2>

<p>
Provisioned automatically using Terraform
</p>

<p>
AWS Cloud Engineer Portfolio Project
</p>

</body>

</html>
EOF

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Verify nginx
systemctl status nginx --no-pager

echo "========== Completed =========="