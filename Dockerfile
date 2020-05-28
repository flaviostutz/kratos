FROM oryd/kratos:v0.3.0-sqlite

WORKDIR /app

ADD /startup.sh /
ADD /kratos.yml /app/
ADD /identity.schema.json /app/

ENTRYPOINT [ "/bin/sh" ]
CMD [ "/startup.sh" ]
