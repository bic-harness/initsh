#!/bin/bash


curl -O -L  https://releases.hashicorp.com/terraform/1.2.1/terraform_1.2.1_linux_amd64.zip
unzip terraform_1.2.1_linux_amd64.zip
mv ./terraform /usr/bin/

ASDF_PATH=$HOME/.asdf
TERRAFORM_VERSIONS="1.2.0 1.2.1 1.2.2 1.2.3"


git clone https://github.com/asdf-vm/asdf.git $ASDF_PATH --branch v0.8.0
echo '. $ASDF_PATH/asdf.sh' >> ~/.bashrc
echo PATH=\$PATH:\$HOME/.asdf/completions/asdf.bash:\$HOME/.asdf/asdf.sh >> /root/.bashrc

asdf --version
export PATH=$HOME/.asdf/shims:$HOME/.asdf/bin:$PATH

asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git

for version in $TERRAFORM_VERSIONS; do
    asdf install terraform $version
done

asdf list terraform; echo \"terraform 1.2.1\" > $HOME/.tool-versions
