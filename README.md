# kratos
Ory Kratos container with configurations by ENV variables

## Usage

* Create a ```docker-compose.yml```

```
version: '3.7'

services:

  kratos:
    build: .
    image: flaviostutz/kratos
    ports:
      - "4433:4433" # public
      - "4434:4434" # admin
    restart: always
    environment:
      - DSN=sqlite:///var/lib/sqlite/db.sqlite?_fk=true
    volumes:
      - kratos-sqlite:/var/lib/sqlite

  kratos-selfservice-ui-node:
    image: oryd/kratos-selfservice-ui-node:latest
    environment:
      - KRATOS_PUBLIC_URL=http://kratos:4433/
      - KRATOS_ADMIN_URL=http://kratos:4434/
    #   - KRATOS_BROWSER_URL=http://localhost:4433
    restart: always
    ports:
      - 4455:3000

  mailslurper:
    image: oryd/mailslurper:latest-smtps
    ports:
      - "4436:4436"
      - "4437:4437"
    restart: always

volumes:
  kratos-sqlite:

```

* Run ```docker-compose up --build```

## Development Tips

This container is not working yet. Seems like a problem in Kratos (redirections comes empty)

