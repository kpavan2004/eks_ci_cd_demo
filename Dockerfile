# pull python base image
FROM python:3.10

# copy application files
ADD /titanic_model_api /titanic_model_api

# specify working directory
WORKDIR /titanic_model_api

# update pip
RUN pip install --upgrade pip

# install dependencies
RUN pip install -r requirements.txt

# remove extra files to reduce image size
RUN rm requirements.txt titanic_model-0.0.1-py3-none-any.whl

# expose port for application
EXPOSE 8001

# start fastapi application
CMD ["python", "app/main.py"]