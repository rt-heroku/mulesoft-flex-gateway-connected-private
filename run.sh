#!/bin/bash

export HEROKU_APP=flex-gw-private
export HEROKU_TEAM="-t heroku-atl"
export FLEX_TMP_CONF=/Users/rodrigo.torres/mulesoft/heroku/connected/conf
export HEROKU_SPACE="--space heroku-east"

export PLATFORM_CONF=`base64 -i $FLEX_TMP_CONF/f24e5939-1983-48fa-a390-efbf5c1d724f.conf`
export PLATFORM_PEM=`base64 -i $FLEX_TMP_CONF/f24e5939-1983-48fa-a390-efbf5c1d724f.pem`
export PLATFORM_KEY=`base64 -i $FLEX_TMP_CONF/f24e5939-1983-48fa-a390-efbf5c1d724f.key`

heroku destroy $HEROKU_APP -c $HEROKU_APP
heroku create $HEROKU_APP $HEROKU_TEAM $HEROKU_SPACE

heroku config:set PLATFORM_CONF=$PLATFORM_CONF
heroku config:set PLATFORM_PEM=$PLATFORM_PEM
heroku config:set PLATFORM_KEY=$PLATFORM_KEY

heroku addons:create papertrail

heroku container:login
heroku container:push web
heroku container:release web
heroku logs -t

#curl -ufoo:bar https://rt-fg-demo.herokuapp.com/api/httpbin/headers
#curl -v -ufoo:bar https://flex-gateway.herokuapp.com/api/payments/


docker run --rm \
-v /Users/rodrigo.torres/mulesoft/heroku/connected/conf:/etc/flex-gateway/rtm \
-v /Users/rodrigo.torres/mulesoft/heroku/connected/custom:/etc/mulesoft/flex-gateway/conf.d/custom \
-p 14550:14550 \
-e FLEX_RTM_ARM_AGENT_CONFIG=/etc/flex-gateway/rtm/f24e5939-1983-48fa-a390-efbf5c1d724f.conf \
-e FLEX_NAME=home-local-private \
mulesoft/flex-gateway