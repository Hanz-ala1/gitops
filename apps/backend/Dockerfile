# A simple Python HTTP server for static files or demo purposes test
FROM python:3.11-slim
WORKDIR /app
COPY . .
EXPOSE 8000
CMD ["python3", "-m", "http.server", "8000"]