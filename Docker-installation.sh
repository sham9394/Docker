#!/bin/bash
# ============================================================
# Docker Installation Script for Ubuntu
# Compatible: Ubuntu 20.04 / 22.04 / 24.04
# ============================================================

set -e  # Exit immediately if a command exits with a non-zero status.

echo "=== Removing old Docker versions ==="
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

echo "=== Updating package index ==="
sudo apt-get update -y

echo "=== Installing prerequisites ==="
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "=== Adding Docker’s official GPG key ==="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "=== Setting up Docker repository ==="
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "=== Installing Docker Engine, CLI, and Compose plugin ==="
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "=== Enabling and starting Docker service ==="
sudo systemctl enable docker
sudo systemctl start docker

echo "=== Adding current user to docker group ==="
sudo usermod -aG docker $USER

echo "=== Docker version check ==="
docker --version
docker compose version

echo "=== Docker installation completed successfully! ==="
echo "Please log out and log back in (or run 'newgrp docker') to apply group changes."

You, Tue 1:06 PM
sudo usermod -aG docker jenkins
