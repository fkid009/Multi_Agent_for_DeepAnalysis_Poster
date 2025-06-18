FROM python:3.10-slim

# 시스템 패키지 설치 (gcc 등)
RUN pip install --upgrade pip && \
    pip install jupyter

# Jupyter Notebook 설치
RUN pip install --upgrade pip && \
    pip install jupyter

# requirements.txt 복사 및 설치
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# 작업 디렉토리
WORKDIR /workspace

# 포트 노출
EXPOSE 8888 8501

# 기본 실행 명령
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
