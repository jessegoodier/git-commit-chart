FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "/app/git_commit_chart/app.py", "--port", "5000", "--host", "0.0.0.0", "--production"] 