FROM debian:buster-slim

WORKDIR /archive_urls_pdf

# https://github.com/nextcloud/docker/issues/380#issuecomment-409593925
RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1

RUN apt-get update && \
    apt-get install -y pdftk binutils git curl

RUN rm -rf /var/cache/apt/*

RUN git clone --depth=1 https://github.com/OpenBookPublishers/archiveurl.git

COPY ./file.pdf ./file.pdf
COPY ./extract_urls.sh ./extract_urls.sh

CMD bash ./extract_urls.sh file.pdf && \
    { echo -n; sleep 15; cat url_list; } | bash ./archiveurl/archiveurl