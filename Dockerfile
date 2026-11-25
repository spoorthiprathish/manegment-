FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5001

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY templet/ ./templet/
COPY static/ ./static/

RUN mkdir -p /app/instance
VOLUME ["/app/instance"]

EXPOSE 5001

CMD ["python", "app.py"]
