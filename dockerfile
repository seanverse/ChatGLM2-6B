FROM nvidia/cuda:12.2.0-devel-ubuntu22.04
MAINTAINER seanx

RUN apt update && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata 

RUN apt install software-properties-common -y
# 添加名为deadsnake的PPA源,为了更新python3.10.13
RUN add-apt-repository "ppa:deadsnakes/ppa"

RUN apt install python3.10 -y

# RUN ln -sf /usr/bin/python3.11 /usr/bin/python

ADD / /ChatGLM2-6B
WORKDIR /ChatGLM2-6B

EXPOSE 8000
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install -r requirements.txt


