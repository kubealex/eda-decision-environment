# EDA Decision Environment Container

This repository contains a container image for running Ansible automation using the `ansible-rulebook` tool in a containerized fashion, and use it in the EDA Automation Controller. The image is designed to facilitate Event Driven Automation (EDA) with Ansible, providing the necessary components and dependencies to execute Ansible rulebooks seamlessly.

## Container Image

The container image is based on the `registry.access.redhat.com/ubi9-minimal` base image and includes the following components:

- Java 17
- Python 3.11
- GCC (GNU Compiler Collection)
- Ansible
- Ansible Collections:
  - ansible.eda
  - dynatrace.event_driven_ansible
  - kubealex.eda
  - kubealex.general
  - redhatinsights.eda
- Other Python packages necessary for event-driven automation:
  - asyncio
  - aiokafka
  - aiohttp
  - aiosignal
  - asyncio_mqtt
  - kubernetes

## Instructions

Follow the steps below to use the container image for event-driven automation with Ansible.

1. **Build the container image**:

   To build the container image locally, execute the following command in the directory containing the provided `Containerfile`:

   ```bash
   podman build -t eda-decision-environment .
   ```

2. **Push the container image**

   To push the container image in a remote repository log-in, tag and push the image:

   ```bash
   podman login <REGISTRY_HOST>
   podman tag eda-decision-environment <REGISTRY_HOST>/<YOUR_USERNAME>/eda-decision-environment
   podman push <REGISTRY_HOST>/<YOUR_USERNAME>/eda-decision-environment
   ```

You are now ready to use it as a standalone container or in EDA Controller.
