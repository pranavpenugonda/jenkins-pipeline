# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package lists and install Apache
RUN apt-get update && apt-get install -y apache2

# Set the working directory to the web server's root folder
WORKDIR /var/www/html/

# Copy your HTML, CSS, and JS files into the container
COPY wikipedia.html /var/www/html/
COPY wikipedia.css /var/www/html/
COPY wikipedia.js /var/www/html/

# Open the necessary ports: 80 for HTTP
EXPOSE 80

# Start the Apache web server in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
