#!/bin/bash

set -eu

pdf_file=$1

echo Uncompress pdf file
pdftk $pdf_file cat output uncompressed_file.pdf uncompress

echo Get URLs
# This command prints the printable characters of the PDF file,
# picks the lines which report /URI string,
# extracts the URL
# and finally gets rid of the duplicates.
# The result is stored in the file url_list
strings uncompressed_file.pdf | \
    grep -ao "/URI (http://.*[^\])" | \
    grep -o 'http[^)]*' | \
    sort -u > url_list
