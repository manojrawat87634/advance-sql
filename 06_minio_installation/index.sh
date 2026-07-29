# Exit immediately if a command fails
set -e

echo "==> 1. Updating package list & installing dependencies..."
sudo apt update && sudo apt install -y wget systemd

echo "==> 2. Downloading MinIO DEB package..."
wget https://dl.min.io/server/minio/release/linux-amd64/minio.deb -O /tmp/minio.deb

echo "==> 3. Installing MinIO package..."
sudo dpkg -i /tmp/minio.deb
rm -f /tmp/minio.deb

echo "==> 4. Creating system user and storage folder..."
sudo groupadd -r minio-user 2>/dev/null || true
sudo useradd -M -r -g minio-user minio-user 2>/dev/null || true
sudo mkdir -p /mnt/data
sudo chown -R minio-user:minio-user /mnt/data

echo "==> 5. Writing configuration to /etc/default/minio..."
sudo tee /etc/default/minio > /dev/null << 'EOF'
MINIO_VOLUMES="/mnt/data"
MINIO_OPTS="--console-address :9001"
MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=minioadmin
EOF

echo "==> 6. Ensuring WSL systemd support is enabled..."
if ! grep -q "systemd=true" /etc/wsl.conf 2>/dev/null; then
    sudo tee -a /etc/wsl.conf > /dev/null << 'EOF'
[boot]
systemd=true
EOF
fi

echo "==> 7. Starting and enabling MinIO service..."
if pidof systemd > /dev/null; then
    sudo systemctl daemon-reload
    sudo systemctl enable minio
    sudo systemctl restart minio
    echo "==> Success! MinIO status:"
    sudo systemctl status minio --no-pager
else
    echo ""
    echo "⚠️  Systemd is not active in this current WSL session yet."
    echo "Please run 'wsl --shutdown' in Windows PowerShell, then reopen Ubuntu and run:"
    echo "sudo systemctl start minio"
fi