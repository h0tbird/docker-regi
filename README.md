# docker-regi

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
