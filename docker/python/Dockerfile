ARG IMG
FROM ${IMG}

RUN apk add python3 python3-dev py3-pip
RUN pip install flask flask_restful redis

# COPY app/app.py app.py
CMD [ "python", "app.py" ]