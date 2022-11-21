# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]

# syntax=docker/dockerfile:1
# FROM python:3.7-alpine
# WORKDIR /code
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# EXPOSE 5000
# COPY . .
# ENTRYPOINT [ "python" ]
# CMD [ "app.py" ]

# FROM python:3.8
# WORKDIR /usr/src/app
# ENV FLASK_RUN_HOST=0.0.0.0
# COPY . .
# RUN pip install --no-cache-dir -r requirements.txt
# EXPOSE 5000
# CMD ["flask", "run"]

# # # syntax=docker/dockerfile:1
# FROM python:3.7-alpine
# WORKDIR /code
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# RUN pip install libpq-dev==9.4.3
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# EXPOSE 5000
# EXPOSE 5432
# COPY . .
# CMD ["flask", "run"]


# FROM python:3.9
# WORKDIR /usr/src/app
# COPY . .
# RUN pip install --no-cache-dir -r requirements.txt
# EXPOSE 5000
# CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]