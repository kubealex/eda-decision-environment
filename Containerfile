FROM registry.access.redhat.com/ubi9-minimal
USER root
RUN microdnf install java-17 python3.11 gcc python3.11-devel -y
RUN rm -rf /usr/bin/python3 && ln -s python3.11 /usr/bin/python3
RUN microdnf clean all && python3 -m ensurepip --upgrade && pip3 install ansible ansible-rulebook asyncio aiokafka aiohttp aiosignal aiomqtt kubernetes
ENV JAVA_HOME="/usr/lib/jvm/jre-17"
RUN mkdir /eda-ansible
RUN ansible-galaxy collection install ansible.eda dynatrace.event_driven_ansible kubealex.eda kubealex.general redhatinsights.eda
WORKDIR /eda-ansible
