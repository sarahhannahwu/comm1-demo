FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000 \
    OPENAI_MODEL=text-embedding-3-small \
    ALLOW_REMOTE_PRESENTER=1

WORKDIR /app

COPY requirements-docker.txt .
RUN pip install --no-cache-dir --disable-pip-version-check -r requirements-docker.txt \
    && rm -rf /root/.cache

COPY aut_live_demo.py .

EXPOSE 5000
VOLUME ["/app/data"]

CMD ["sh", "-c", "python aut_live_demo.py --port ${PORT}"]