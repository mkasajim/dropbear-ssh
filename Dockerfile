FROM alpine:3.17
WORKDIR /app
ENV SSHUSER=myuser
# The SSH user to create
RUN apk --no-cache add dropbear &&\
    mkdir -p /home/$SSHUSER/.ssh &&\
    adduser -s /bin/sh -D $SSHUSER --home /home/$SSHUSER &&\
    chown -R $SSHUSER:$SSHUSER /home/$SSHUSER

CMD ["/bin/sh", "-c", "/usr/sbin/dropbear -RFEwgsjk -G ${SSHUSER} -p 22"]
EXPOSE 22
