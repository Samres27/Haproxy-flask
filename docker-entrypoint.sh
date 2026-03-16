#!/bin/bash
cd /app

#gunicorn --keep-alive 10 -k gevent --bind 0.0.0.0:6767 -w 4 backend:app --access-logfile -
gunicorn --keep-alive 10 -k gevent --bind 0.0.0.0:6767 -w 4 backend:app