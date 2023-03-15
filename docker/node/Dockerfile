ARG IMG
FROM ${IMG}

RUN apk add nodejs-current npm
RUN pip install flask flask_restful redis

# COPY app/app.py app.py
CMD [ "python", "app.py" ]