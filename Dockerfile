FROM node

RUN ["mkdir","/var/project"]
WORKDIR /var/project


CMD ["echo","specify your cmd"]