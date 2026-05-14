FROM python:3-alpine

# create a non-root user for security
RUN adduser -D appuser

# set a working directory so files aren't scattered in /
WORKDIR /app

# copy everything in the current local directory into /app in the container and change ownership
COPY --chown=appuser:appuser . .

# switch to non-root user
USER appuser

# run main script
CMD ["python3", "hivebox.py"]