# archive_urls_pdf
This piece of software extracts URLs from PDF files and pass them on to [archiveurl](https://github.com/OpenBookPublishers/archiveurl) to archive them on Wayback Machine.

# Run
Store the PDF file as `file.pdf` in the project folder and then run:

$ `docker build . -t openbookpublishers/archive_urls_pdf`

$ `docker run --rm openbookpublishers/archive_urls_pdf`
