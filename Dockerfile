FROM alpine
RUN apk --update add git vim
RUN adduser -D ahrechan && echo "ahrechan:P@$$w0rd"|chpasswd
WORKDIR /opt/hll
RUN git clone https://github.com/pokasks/practice-git-2.git
COPY test_hll.txt .
COPY .vimrc /home/ahrechan
RUN chown -R ahrechan: /home/ahrechan
ENTRYPOINT ["ping"]
CMD ["8.8.8.8"]


