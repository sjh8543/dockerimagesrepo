sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo bash -c "cat >> /etc/apt/sources.list.d/kubernetes.list" <<EOF
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update

#Install docker if you don't have it already.
sudo apt-get install -y docker.io
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni

. join_script.sh
