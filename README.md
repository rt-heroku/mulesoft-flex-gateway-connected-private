# mulesoft-flex-gateway-connected-private

Example of deploying
[the official Flex Gateway Docker image](https://hub.docker.com/r/mulesoft/flex-gateway)
to a Heroku Private Space in Connected Mode.

## Try it now!

Fire up an Flex Gateway on [Heroku](https://www.heroku.com/) with a single click:

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Manual deployment

You will need to create a Heroku account and install the Heroku CLI, eg.
`brew install heroku`.

```
git clone git@github.com:garciarodrigor/mulesoft-flex-gateway-connected-private.git
cd mulesoft-flex-gateway-connected-private
heroku container:login
heroku create
heroku config:set PLATFORM_CONF=<register-conf-base64> PLATFORM_PEM=<register-pem-base64> PLATFORM_KEY=<register-key-base64>
heroku container:push web
heroku container:release web
heroku open
```
