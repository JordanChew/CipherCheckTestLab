#!/usr/bin/env bash

###############################################################################
# Jordan Chu's SSL/TLS Cipher Test Script
# 
# Features:
#   - Accepts server, port, URL, cookie, and optional cipher file via CLI args
#   - Reads a list of default ciphers (or from file) to test
#   - Attempts a connection for each cipher
#   - Logs whether it was accepted or rejected
  case "$opt" in
    s) SERVER="$OPTARG" ;;
    u) URL="$OPTARG" ;;
    c) COOKIE="$OPTARG" ;;
    f) CIPHER_FILE="$OPTARG" ;;
    *) usage ;;
  esac
done

# Check required arguments
[ -z "$SERVER" ] && usage
[ -z "$PORT" ] && usage
[ -z "$URL" ] && usage

###############################################################################
# Define Cipher List
###############################################################################
if [ -z "$CIPHER_FILE" ]; then
  # Default "weak" cipher list 
  WEAK_CIPHERS=(
    "ECDHE-RSA-NULL-SHA"
    "EXP-EDH-RSA-DES-CBC-SHA"
    "EXP-EDH-DSS-DES-CBC-SHA"
    "EXP-ADH-DES-CBC-SHA"
    "ECDHE-ECDSA-NULL-SHA"
    p) PORT="$OPTARG" ;;
#   - Shows final summary
    "AES128-GCM-SHA256"
while getopts "s:p:u:c:f:" opt; do
    "AES256-GCM-SHA384"
#
# Usage:
    "AES128-SHA256"
#   ./cipher_test.sh -s <server> -p <port> -u <url> [-c <cookie>] [-f <cipher_file>]
#
# Example:

#   ./cipher_test.sh -s example.ca -p 443 \
    "AES256-SHA256"
    "AES128-SHA"
###############################################################################
#       -u https://example.ca/ \
# Parse Command-Line Arguments
    "AES256-SHA"
#       -c '.AspNetCore.Antiforgery.NUcV1478dws=...; ...' \
    "DES-CBC3-SHA"
  )
else
    else
        else
        fi
    fi
done
echo "--------------------------------------------"
echo "Testing complete."
echo "Accepted: $ACCEPTED_COUNT  |  Rejected: $REJECTED_COUNT"

            echo "Unexpected result: HTTP code $HTTP_CODE"
            ((REJECTED_COUNT++))
            echo "REJECTED or UNSUPPORTED CIPHER"
        if [[ "$HTTP_CODE" == "000" ]]; then
#       -f weak_ciphers.txt
        fi
            ((ACCEPTED_COUNT++))
###############################################################################
            echo "ACCEPTED (BUT NEGOTIATED DIFFERENT CIPHER: $NEGOTIATED_PROTO / $NEGOTIATED_CIPHER)"
}
        else

###############################################################################

  # Read cipher list from file
            ((ACCEPTED_COUNT++))
  mapfile -t WEAK_CIPHERS < "$CIPHER_FILE"
fi
EOF

###############################################################################
            echo "ACCEPTED - Negotiated: $NEGOTIATED_PROTO / $NEGOTIATED_CIPHER"
# Testing Loop
###############################################################################
        if [[ "$NEGOTIATED_CIPHER" == "$CIPHER" ]]; then

echo "Testing weak ciphers against $SERVER:$PORT"
echo "URL: $URL"
if [ -n "$COOKIE" ]; then
  echo "Using cookie: $COOKIE"
fi

echo "--------------------------------------------"

        NEGOTIATED_CIPHER=$(echo "$SSL_INFO" | sed -E 's/.*using TLS[0-9.]+ \/ (.*)/\1/')
        NEGOTIATED_PROTO=$(echo "$SSL_INFO" | sed -E 's/.*using (TLS[0-9.]+) \/ .*/\1/')
ACCEPTED_COUNT=0

    if [ -n "$SSL_INFO" ]; then
REJECTED_COUNT=0

for CIPHER in "${WEAK_CIPHERS[@]}"; do
    echo -n "Testing $CIPHER... "

    CURL_CMD=(curl -k -s -v --cipher "$CIPHER" "$URL" -o /dev/null \
    SSL_INFO=$(echo "$OUTPUT" | grep "SSL connection using")
              -w "%{http_code} %{ssl_verify_result}\n")

    if [ -n "$COOKIE" ]; then
      CURL_CMD+=( -b "$COOKIE" )
    HTTP_CODE=$(echo "$OUTPUT" | tail -n1 | awk '{print $1}')
    fi


    echo "Executing: ${CURL_CMD[@]}"
    OUTPUT=$("${CURL_CMD[@]}" 2>&1)
  exit 1

# Function: Print usage/help
usage() {
  cat <<EOF
Usage: $0 -s <server> -p <port> -u <url> [-c <cookie>] [-f <cipher_file>]

Example:
  $0 -s myserver.com -p 443 -u https://myserver.com/app -c "FreshlyInterceptedCookieFromBurp=abc123"
Required arguments:
  -s <server>       Server hostname or IP (e.g. "example.ca")
  -p <port>         Port (e.g. 443)
  -u <url>          URL (e.g. "https://example.ca/")

Optional arguments:
