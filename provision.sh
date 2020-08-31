#!/bin/bash
sudo apt update -y && sudo apt install -y curl vim jq git make docker.io
sudo usermod -aG docker ubuntu
TOKEN='omega'
export K3S_HOST=controlplane.omega.dobc
export K3S_TOKEN=$TOKEN
export K3S_URL=https://$K3S_HOST:6443
curl -sfL https://get.k3s.io | sh -
