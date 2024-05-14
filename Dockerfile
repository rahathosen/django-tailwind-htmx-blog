# Use the Python 3.8 base image
FROM python:3.8-slim

# Set environment variables to prevent Python from writing pyc files and buffering stdout and stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /django-tailwind-htmx-blog

# Copy the requirements file into the container and install dependencies
COPY requirements.txt /django-tailwind-htmx-blog/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project directory into the container
COPY . /django-tailwind-htmx-blog/

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose port 8000 to allow communication to/from the server
EXPOSE 8000

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
