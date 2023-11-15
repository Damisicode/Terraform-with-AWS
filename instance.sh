#!/bin/bash
apt update
apt install -y apache2

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install the AWS CLI
apt install -y awscli

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>My Terraform Project</title>
    <style>
        /* Add animatikon and styling for the text */
    @keyframes colorChange {
        0% { color: red; }
        50% { color: green; }
        100% { color: blue; }
    }
    </style>
</head>
<body>
    <h1>Terraform Project Server 1</h1>
    <h2>Instance ID: <span style="color:green">$INSTANCE_ID</span></h2>
    <p>Welcome to my project website!</p>

</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2