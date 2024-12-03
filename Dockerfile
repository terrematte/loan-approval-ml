FROM python:3.10.12

RUN pip install virtualenv
ENV VIRTUAL_ENV=/venv
RUN virtualenv venv -p python3
ENV PATH="VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
ADD . /app

# install dependencies
RUN pip install -r requirements.txt

# expose port
EXPOSE 5000

# run application
ENV FLASK_APP=app.py

ENTRYPOINT [ "flask"]
CMD [ "run", "--host", "0.0.0.0" ]
