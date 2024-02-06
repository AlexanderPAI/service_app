FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
# Открываем порт
EXPOSE 8000

RUN python -m pip install --upgrade pip
RUN pip install -r /temp/requirements.txt

# Создаем пользователя внутри докер контейнера
RUN adduser --disabled-password service-user

# Чтобы все команды внути контейнера запускались от имени
# созданного пользователя
USER service-user
