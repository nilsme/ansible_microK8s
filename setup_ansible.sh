#!/bin/bash
ANSIBLE=$(conda info --envs | grep ansible | awk '{print $2}')

if [ ! -d "$ANSIBLE" ]; then
  conda init bash
  source ~/.bash_profile
  source ~/.bashrc
  conda create -y -n ansible python -c conda-forge
  conda activate ansible
  pip install ansible passlib 
else
  echo "Conda env ansible already exists in $ANSIBLE"
fi