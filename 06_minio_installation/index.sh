# 1. Download the latest MinIO DEB package
wget https://dl.min.io/server/minio/release/linux-amd64/minio.deb

# 2. Install the package
sudo dpkg -i minio.deb
# 1. Create a dedicated group and system user
sudo groupadd -r minio-user
sudo useradd -M -r -g minio-user minio-user

# 2. Create the directory where MinIO will store your files
sudo mkdir -p /mnt/data

# 3. Give ownership of the storage directory to minio-user
sudo chown -R minio-user:minio-user /mnt/data
sudo nano /etc/default/minio

# Path to your storage directory
MINIO_VOLUMES="/mnt/data"

# Console UI port (runs on port 9001)
MINIO_OPTS="--console-address :9001"

# Access credentials (Change these to secure keys for real projects)
MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=minioadmin


# 1. Reload systemd configuration
sudo systemctl daemon-reload

# 2. Start the MinIO service
sudo systemctl start minio

# 3. Enable MinIO to start automatically on system reboots
sudo systemctl enable minio

# 4. Check that MinIO is active and running
sudo systemctl status minio