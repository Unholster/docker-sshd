FROM alpine:3.7

RUN apk add --no-cache openssh

# Configure sshd
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ no/ /etc/ssh/sshd_config \
    && sed -i s/#PasswordAuthentication.*/PasswordAuthentication\ no/ /etc/ssh/sshd_config \
    && sed -i s/#ChallengeResponseAuthentication.*/ChallengeResponseAuthentication\ no/ /etc/ssh/sshd_config \
    && sed -i s/AuthorizedKeysFile.*/AuthorizedKeysFile\ \\/authorized_keys/ /etc/ssh/sshd_config


# Remove root password
RUN passwd -d root
RUN adduser -D -s /bin/ash visitor
RUN passwd -u visitor

# Embed host keys
RUN ssh-keygen -A

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
