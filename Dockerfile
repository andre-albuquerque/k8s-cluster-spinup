FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install ansible wget unzip python3-pip -y && \
    pip3 install boto && \
    wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip -O /tmp/terraform_1.8.5_linux_amd64.zip && \
    unzip /tmp/terraform_1.8.5_linux_amd64.zip -d /usr/bin
RUN ansible-galaxy collection install amazon.aws && \
    cp -rf ~/.ansible/collections/ansible_collections /usr/local/lib/python3.8/dist-packages/ && \
    wget https://raw.githubusercontent.com/ansible-community/contrib-scripts/main/inventory/ec2.py -O /usr/local/lib/python3.8/dist-packages/ansible_collections/amazon/aws/plugins/module_utils/ec2.py