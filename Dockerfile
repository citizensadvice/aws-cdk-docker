FROM python:3.12

ENV NODE_VERSION=18
ENV CDK_VERSION=""

RUN apt update && apt install -y wget && wget -qO - https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
      apt install -y unzip nodejs git && \
      apt clean

RUN npm install -g aws-cdk${CDK_VERSION}

RUN wget "https://awscli.amazonaws.com/awscli-exe-linux-$(arch).zip" -O "/tmp/awscliv2.zip" && \
      unzip -q -o /tmp/awscliv2.zip -x "*/examples/*" -d /tmp && \
      /tmp/aws/install &&  rm -f /tmp/awscliv2.zip
