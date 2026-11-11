#!/bin/sh -l

if [ "$INPUT_ADDITIONAL_SOURCE_FILES" != "" ]; then
  for file in $INPUT_ADDITIONAL_SOURCE_FILES; do
    JS_FILES="$JS_FILES -F $file=@$file"
  done
fi

# --retry: retry 408, 429, 500, 502, 503, 504 and timeouts, waiting for
#   Retry-After when the server sends it (otherwise 1s, 2s, 4s).
# --retry-max-time: don't spend more than 2 minutes retrying.
# --fail-with-body: exit non-zero (failing the step) if the upload still
#   fails, and print the error response.
curl \
  --retry 3 \
  --retry-max-time 120 \
  --fail-with-body \
  $INPUT_ENDPOINT \
  -F api_key=$INPUT_API_KEY \
  -F revision=$GITHUB_SHA \
  -F minified_url=$INPUT_MINIFIED_URL \
  -F minified_file=@$INPUT_MINIFIED_FILE \
  -F source_map=@$INPUT_SOURCE_MAP \
  $JS_FILES
