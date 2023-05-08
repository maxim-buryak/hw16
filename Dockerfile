FROM ubuntu:latest

RUN apt-get update && apt-get install -y apt-utils && \
    apt-get update && apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get install -y ansible && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    ssh-keygen -A && \
    mkdir -p /root/.ssh && \
    echo "Host *" > /root/.ssh/config && \
    echo "StrictHostKeyChecking no" >> /root/.ssh/config


CMD ["/usr/sbin/sshd", "-D"]
