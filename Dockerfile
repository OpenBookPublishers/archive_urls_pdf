FROM python:3.8.0-slim-buster

WORKDIR /archive_urls_pdf

RUN apt-get update && \
    apt-get install -y binutils git curl gcc

RUN rm -rf /var/cache/apt/*

RUN git clone --depth=1 https://github.com/OpenBookPublishers/archiveurl.git

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY ./file.pdf ./file.pdf
COPY ./extract_urls.sh ./extract_urls.sh

CMD bash ./extract_urls.sh file.pdf && \
    { echo -n; sleep 15; cat url_list; } | bash ./archiveurl/archiveurl