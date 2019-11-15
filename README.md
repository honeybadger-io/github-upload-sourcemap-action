# Honeybadger Upload Sourcemap Action

Uploading your source maps to Honeybadger makes error resolution faster by enabling the generation of stack traces from your original, un-minified Javascript code.

Check out [our docs](https://docs.honeybadger.io/lib/javascript/guides/using-source-maps.html) for more info about source map uploads.

#### Inputs

Use these inputs to customise the action.

Input Name | Default | Required? | Description
------------ | ------------- | ------------ | -------------
api_key | N/A | Y | The Honeybadger project API key
minified_url | N/A | Y | The URL of the minified file on your server.
minified_file | N/A | Y | The local path of the unminified javascript file.
source_map | N/A | Y | The local path of the source map.
additional_source_files | "" | N |  One or more additional source files which may be referenced by your source map. The name should be the URL that would normally be used to access the file, and the value should be the file itself.
endpoint | https://api.honeybadger.io/v1/source_maps | N | The source map submission endpoint. Only used for testing

#### Example

```yaml
on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: honeybadger-io/github-notify-deploy-action@master
      with:
        api_key: ${{ secrets.HONEYBADGER_API_KEY }}
        minified_url: https://example.com/assets/application.min.js
        minified_file: path/to/application.min.js
        source_map: path/to/application.js.map
```
