FROM alpine:latest
RUN apk add --no-cache curl unzip

# Download and install Xray-core
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin && \
    rm /tmp/xray.zip

# Create config directory and copy config file
RUN mkdir -p /etc/xray
COPY config.json /etc/xray/config.json

# Expose the correct port
EXPOSE 10000

# Run Xray
CMD ["xray", "run", "-config", "/etc/xray/config.json"]
