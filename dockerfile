# Use the official PostgreSQL image as a base
FROM postgres:latest

# Set environment variables if you want to hardcode (not recommended for sensitive data)
ENV POSTGRES_USER=lintao
ENV POSTGRES_PASSWORD=lintao
ENV POSTGRES_DB=demo

# Add your init.sql script to the container
COPY init.sql /docker-entrypoint-initdb.d/

# The base image already exposes port 5432 and has the necessary entrypoint scripts
