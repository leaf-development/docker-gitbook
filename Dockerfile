FROM node:5

RUN apt-get update && \
    apt-get install -y unzip calibre && \
    npm install \
       gitbook-cli \
       svgexport \
       gitbook-plugin-simple-page-toc -g && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN gitbook fetch latest

ENV BOOKDIR /gitbook

VOLUME $BOOKDIR

EXPOSE 4000

WORKDIR $BOOKDIR

CMD ["gitbook", "--help"]