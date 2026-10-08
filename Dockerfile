FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000 \
    ALLOW_REMOTE_PRESENTER=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY aut_live_demo.py .

EXPOSE 5000
VOLUME ["/app/data"]

CMD ["sh", "-c", "python aut_live_demo.py --port ${PORT}"]