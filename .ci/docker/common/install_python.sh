#!/bin/bash
set -ex

apt-get update
sudo add-apt-repository ppa:deadsnakes/ppa
apt-get install -y python${PYTHON_VERSION} python${PYTHON_VERSION}-dev python3-pip python${PYTHON_VERSION}-venv

ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python
python -m venv /var/lib/jenkins/lint
source /var/lib/jenkins/lint/bin/activate

python -mpip install --upgrade pip
python -mpip install -r /opt/requirements-ci.txt
python -mpip install cmake==3.31.6
