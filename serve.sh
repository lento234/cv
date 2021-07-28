#!/bin/bash

IPADDR=`hostname -I | cut -d ' ' -f1`
mkdocs serve --dev-addr "$IPADDR:8000"
