FROM python:3.14-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.14-slim
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY --from=builder /install /usr/local
RUN groupadd --gid 1000 appgroup && \
    useradd --uid 1000 --gid appgroup --create-home appuser
USER appuser
COPY src/ src/
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD python -c "import http.client; c=http.client.HTTPConnection('localhost',8080); c.request('GET','/health'); r=c.getresponse(); exit(0 if r.status==200 else 1)"
CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8080"]
