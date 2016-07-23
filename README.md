Shadowsocks Server in docker
===


```
  docker run -d -p 8838:8888 icymint/shadowsocks
```

Change config
```
  docker run -d -v "$PWD/conf.json":/conf.json -p 8838:8888 icymint/shadowsocks
```


Build own docker
```
  ./build.sh
```
