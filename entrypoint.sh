#!/bin/sh -l

if [ "$INPUT_ADDITIONAL_SOURCE_FILES" != "" ]; then
  for file in $INPUT_ADDITIONAL_SOURCE_FILES; do
    JS_FILES="$JS_FILES -F $file=@$file"
  done
fi

curl \
  $INPUT_ENDPOINT \
  -F api_key=$INPUT_API_KEY \
  -F revision=$GITHUB_SHA \
  -F minified_url=$INPUT_MINIFIED_URL \
  -F minified_file=@$INPUT_MINIFIED_FILE \
  -F source_map=@$INPUT_SOURCE_MAP >> \
  $JS_FILES
