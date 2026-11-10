#!/bin/bash
if [ "$#" -eq 0 ] || [ -z "$1" ]; then
    echo "Error: URL is not specified.\n\tUsage: check-page-speed <url>\n" >&2
    exit 1
fi

if [[ "$1" != http://* && "$1" != https://* ]]; then
    echo "Error: The URL must start with http:// or https://" >&2
    exit 1
fi

CURL_TPL=$(cat <<EOF
Testing Website Response Time for: 
%{url_effective}
===================================
DNS Lookup:              %{time_namelookup}s
Time to connect:         %{time_connect}s
Time of data transfer:   %{time_pretransfer}s
Time of redirect:        %{time_redirect}s
Tite to First byte:      %{time_starttransfer}s
===================================
Total time:              %{time_total}s
===================================\n
EOF
)

curl -L -s -w "$CURL_TPL" -o /tmp/test-speed "$1" && rm /tmp/test-speed
