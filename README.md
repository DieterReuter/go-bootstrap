# go-bootstrap
[![Build Status](https://travis-ci.org/DieterReuter/go-bootstrap.svg?branch=master)](https://travis-ci.org/DieterReuter/go-bootstrap)


## Background
According to this comment https://github.com/docker/docker/issues/27384#issuecomment-255408388
```
If you mean binary packages, then, no. We only package releases. But it's pretty easy to build your own. On any machine that has a Go install (doesn't have to be arm64), run:
  git clone https://go.googlesource.com/go
  cd go/src
  export GOROOT_BOOTSTRAP=$(go env GOROOT)
  GOOS=linux GOARCH=arm64 ./bootstrap.bash
This will create a ../../go-linux-arm64-bootstrap.tbz that you can just unpack on the target machine and use. You may have to set GOROOT on the target to where you unpacked the tarball.
```
it should be really easy to create such bootstrap packages in advance for ARM64.


## How I build it
Just run the build script:
```
./build.sh
```

This gives us the following bootstrap files for ARMv6 and ARM64:
```
ls -al builds/20170118-185206/
total 240128
drwxr-xr-x  6 dieter  staff       204 Jan 18 19:54 .
drwxr-xr-x@ 3 dieter  staff       102 Jan 18 19:52 ..
-rw-r--r--  1 dieter  staff  61699535 Jan 18 19:54 go-linux-arm-bootstrap.tbz
-rw-r--r--  1 dieter  staff        93 Jan 18 19:54 go-linux-arm-bootstrap.tbz.sha256
-rw-r--r--  1 dieter  staff  61235020 Jan 18 19:54 go-linux-arm64-bootstrap.tbz
-rw-r--r--  1 dieter  staff        95 Jan 18 19:54 go-linux-arm64-bootstrap.tbz.sha256
```


## License

MIT - see the [LICENSE](./LICENSE) file for details.
