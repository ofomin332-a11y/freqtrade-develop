FROM freqtradeorg/freqtrade:develop

WORKDIR /freqtrade

COPY --chown=ftuser:ftuser . /freqtrade/

ENV FREQTRADE__TELEGRAM__ENABLED=true

EXPOSE 8080

ENTRYPOINT ["freqtrade"]
CMD ["trade", "--config", "/freqtrade/user_data/config.json"]
