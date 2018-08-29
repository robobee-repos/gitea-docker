# Gitea

## Description

The image modifies the base image and adds the option to have a input directory for configuration files that can be used with Kubernetes Config Map. In addition, it adds rsync to synchronize the Gitea public files from `/usr/src/gitea/public` to `/var/www/html` the web root directory. That is necessary if the web root directory is mounted as a Kubernetes Persistent Volume.

## Environment Parameters

| Variable | Default | Description |
| ------------- | ------------- | ----- |
| `SYNC_ENABLED`  | `true` | Set to `false` to deactivate the application will be done. |
| `SYNC_TIME_S`  | `300` | Set to the seconds that will be waited before a full update of the application will be done. |
| `DEBUG`  | `false`  | Set to `true` for additional debug output. |
| `PIWIK_JAVASCRIPT`  | "" | Piwik tracking code. Will be added to the footer. |
| `GOOGLE_ANALYTICS_JAVASCRIPT`  | "" | Google Analytics tracking code. Will be added in the header. |

## Directories

| Path | Description |
| ------------- | ----- |
| `/data`  | Data directory. |
| `/var/www/html`  | www-root directory. |

## Input Configration

| Source | Destination |
| ------------- | ------------- |
| `/custom-in/*` | /data/gitea/ |

## Exposed Ports

| Port | Description |
| ------------- | ----- |
| 3000  | http |

## Test

The docker-compose file `test.yaml` can be used to start the container. The installation can be then accessed from `localhost:3000`.

```
cd test
make test
```

## License

Gitea is licensed under the [MIT License](https://github.com/go-gitea/gitea/blob/master/LICENSE) license.

This image is licensed under the [MIT](https://opensource.org/licenses/MIT) license.

Copyright 2017-2018 Erwin Müller

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
