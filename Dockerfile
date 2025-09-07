FROM ubuntu

RUN apt-get update
RUN apt-get install sudo -y
RUN sudo apt-get update
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get install wget -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install unzip -y
RUN sudo apt install python3 -y
RUN sudo apt install python3-dev -y
RUN sudo apt install python3-pip -y
RUN sudo apt install python3-pillow -y
RUN sudo apt update



RUN apt install tzdata -y
RUN apt install ffmpeg -y
RUN apt-get install nginx -y

COPY root /

RUN sudo chmod 777 /install.sh
RUN bash install.sh
RUN sudo chmod 777 /openlist-install.sh
RUN bash Openlist-install.sh

RUN mv /nginx.conf /etc/nginx/


COPY /start.sh /
CMD chmod 0777 start.sh && bash start.sh
CMD wget https://raw.githubusercontent.com/winkxx/OpenList/main/start.sh -O start.sh && chmod 0777 start.sh && bash start.sh
