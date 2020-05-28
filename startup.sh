#!/bin/bash

kratos -c /app/kratos.yml migrate sql -e --yes

kratos serve -c /app/kratos.yml --dev

