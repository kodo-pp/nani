#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from os import chmod

output_nm = 'nani'

util_pages_nm = {
    'page403': 'page403.html',
    'page404': 'page404.html',
    'page500': 'page500.html',
}
server_itself_nm = 'server.sh'
server_wrapper_nm = 'wrapper.sh'

server_fmt = {
    'server_dir': '"\'$dir\'"',
    'page403':    '"\'$page403\'"',
    'page404':    '"\'$page404\'"',
    'page500':    '"\'$page500\'"',
    'index_file': '"\'$index_file\'"',
}

wrapper_str = ''
server_str = ''
util_pages_str = {i: '' for i in util_pages_nm.keys()}

with open(server_wrapper_nm) as wrapper:
    wrapper_str = wrapper.read()

with open(server_itself_nm) as server:
    server_str = server.read()

for k, v in util_pages_nm.items():
    with open(v) as page:
        util_pages_str[k] = page.read()

server_str = server_str.format(**server_fmt)
formatted_str = wrapper_str.format(server_cmd=server_str, **util_pages_str)

with open(output_nm, 'w') as outfile:
    outfile.write(formatted_str)

chmod(output_nm, 0o755)
