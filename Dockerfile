FROM python:3.6-slim

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Dependencias del sistema
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Instalar dependencias Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar proyecto
COPY . .

# Script de entrada que arranca DOS instancias de Daphne:
#   - Puerto 8000: HTTP normal (vulnerable a CL.TE)
#   - Puerto 8001: WebSocket
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8000 8001

ENTRYPOINT ["/docker-entrypoint.sh"]
