FROM ruby:onbuild

MAINTAINER Sho2010(sho20100@gmail.com)

ENV SLACK_TOKEN="" \
    LOG_CHANNEL="#narikiri-log" \
    VERIFICATION_TOKEN=""

EXPOSE 8000
CMD thin -R ./config.ru -p 8000 -e "production" -o 0.0.0.0 start && tail -f /dev/null

