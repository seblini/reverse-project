FROM kalilinux/kali-rolling:arm64

WORKDIR /app

COPY . /app

RUN apt update && apt upgrade -y && apt install curl -y && apt install hping3 slowloris -y
RUN apt install apache2-utils -y

CMD ["./attack.sh"]
