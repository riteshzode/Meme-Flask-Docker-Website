# syntax=docker/dockerfile:1

FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt /app
RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install -r requirements.txt

COPY . /app

EXPOSE 5000

# ENTRYPOINT ["python3"]
# CMD ["app.py"]
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]