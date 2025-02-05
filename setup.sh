#!/usr/bin/env bash
set -xeuo pipefail

sudo apt update

sudo apt install -y ansible python3-venv curl git

git clone https://github.com/lpi-code/lpi-code.metatrader.git 

cd lpi-code.metatrader

python3 -m venv .venv

pip insfall -r dev-requirements.txt
ansible-galaxy install -r requirements.yml
ansible-galaxy role install lpi-code.metatrader
