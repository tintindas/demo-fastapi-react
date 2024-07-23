FROM node:21-alpine

#Install python3 and dependencies
RUN apk add --no-cache python3 py3-pip
RUN rm /usr/lib/python*/EXTERNALLY-MANAGED && \
    python3 -m ensurepip && \
    pip3 install fastapi

WORKDIR /app

# Backend
COPY ./backend/ backend/

# Frontend
COPY ./frontend/package.json ./frontend/package.json
WORKDIR /app/frontend
RUN npm install
COPY ./frontend/ .

# Run
WORKDIR /app
COPY ./start.sh start.sh
RUN chmod +x start.sh

CMD ["./start.sh"]
