FROM python:3.9
RUN mkdir build
COPY ./app/requirements.txt ./build
RUN pip install --no-cache-dir --upgrade -r /build/requirements.txt
COPY ./app ./build
WORKDIR ./build
CMD ["uvicorn", "main:shop","--proxy-headers", "--host", "0.0.0.0", "--port", "80"]