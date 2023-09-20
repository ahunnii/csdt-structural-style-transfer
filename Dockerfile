# app/Dockerfile

# FROM python:3.8-slim
FROM lucone83/streamlit-nginx:python3.8

ENV PYTHONPATH=/app:$PYTHONPATH

USER root

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# RUN git clone https://github.com/robinsonkwame/csdt-structural-style-transfer style/

COPY . .

RUN pip3 install -r requirements_9_11_2023.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "app/ui.py", "--server.port=8501", "--server.address=0.0.0.0"]


# FROM lucone83/streamlit-nginx:python3.8

# WORKDIR /app

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     curl \
#     software-properties-common \
#     git \
#     && rm -rf /var/lib/apt/lists/*

# COPY . .

# RUN pip3 install -r requirements_9_11_2023.txt

# EXPOSE 8501

# HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# ENTRYPOINT ["streamlit", "run", "app/ui.py", "--server.port=8501", "--server.address=0.0.0.0"]