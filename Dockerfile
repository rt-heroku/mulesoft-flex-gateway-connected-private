FROM mulesoft/flex-gateway:1.0.0

ENV S6_READ_ONLY_ROOT=1 \
  FLEX_RTM_ARM_AGENT_CONFIG=/app/platform.conf \
  FLEX_CONFIG_DIR=/etc/mulesoft/flex-gateway/conf.d:/app

COPY entrypoint /etc/cont-init.d/configure
COPY config/ /app
