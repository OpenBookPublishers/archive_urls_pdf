#!/usr/bin/env python3
import fitz

doc = fitz.open('file.pdf')

urls = []

for page in doc:
    uris = [link['uri'] for link in page.get_links() if link.get('uri')]
    urls.extend(uris)

with open('url_list', 'w') as output:
    for url in sorted(set(urls)):
        output.write(f'{url}\n')
