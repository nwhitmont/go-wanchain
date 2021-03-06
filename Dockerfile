
FROM alpine:3.6

RUN mkdir /wanchain

ADD ./DOCKER/data /wanchain/data
ADD . /wanchain/src

RUN \
  apk add --update git go make gcc musl-dev linux-headers gdb && \
  (cd wanchain/src && make geth)                              && \
  cp /wanchain/src/build/bin/geth /usr/local/bin/

EXPOSE 8545
EXPOSE 17717
EXPOSE 17717/udp

# ENTRYPOINT ["geth", "--verbosity", "5", "--datadir", "/wanchain/data", "--etherbase", "0x2d0e7c0813a51d3bd1d08246af2a8a7a57d8922e", "--networkid", "5201314", "--mine", "--minerthreads", "1", "--nodiscover", "--rpc"]

