FROM registry.access.redhat.com/ubi9-minimal
USER root
RUN microdnf install java-17 python3 gcc python3-devel -y && microdnf clean all && python -m ensurepip --upgrade && pip3 install ansible ansible-rulebook asyncio aiokafka aiohttp aiosignal asyncio_mqtt kubernetes
ENV JAVA_HOME="/usr/lib/jvm/jre-17"
RUN mkdir /eda-ansible
RUN ansible-galaxy collection install ansible.eda kubealex.eda redhatinsights.eda
WORKDIR /eda-ansible
