# docker-regi

[![Build Status](https://travis-ci.org/h0tbird/docker-regi.svg?branch=master)](https://travis-ci.org/h0tbird/docker-regi)
[![](https://badge.imagelayers.io/h0tbird/regi:latest.svg)](https://imagelayers.io/?images=h0tbird/regi:latest 'Get your own badge on imagelayers.io')

This container is member of the [*booddies*](https://github.com/h0tbird/booddies) fellowship.

Clone and build:
```
git clone https://github.com/h0tbird/docker-regi.git
cd docker-regi
./bin/build
```

Install and run:
```
sudo ./bin/install
sudo systemctl start regi
```

Tail the output:
```
journalctl -f -u regi
```

## License

Copyright 2015 Marc Villacorta Morera

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
