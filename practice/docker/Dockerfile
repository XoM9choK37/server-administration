FROM python:3.11-slim AS builder

WORKDIR /app
COPY pyproject.toml .

RUN pip install --user --no-cache-dir . && \
    pip install --user --no-cache-dir uvicorn

FROM python:3.11-slim

WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY src/ ./src/

ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH=/app

EXPOSE 8049

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8049"]
