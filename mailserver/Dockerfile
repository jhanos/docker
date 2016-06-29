FROM debian
MAINTAINER jhanosl@gmail.com

RUN apt-get update

# Postfix
RUN echo "postfix postfix/mailname string thonis.eu" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

RUN DEBIAN_FRONTEND=noninteractive  apt-get install -y postfix

# Dovecot
RUN apt-get install -y dovecot-imapd

#Conf
RUN sed -i '/myhostname/d' /etc/postfix/main.cf
RUN postconf -e myhostname=www.thonis.eu

RUN echo "smtpd_sasl_type = dovecot" >> /etc/postfix/main.cf
RUN echo "smtpd_sasl_path = private/auth-client" >> /etc/postfix/main.cf
RUN echo "broken_sasl_auth_clients = yes" >> /etc/postfix/main.cf
RUN echo "smtpd_sasl_auth_enable = yes" >> /etc/postfix/main.cf
RUN echo "smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination" >> /etc/postfix/main.cf

COPY start_mail.sh /root/start_mail.sh
CMD /root/start_mail.sh
