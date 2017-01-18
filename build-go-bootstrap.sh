#!/bin/bash
set -e
set -x

# Create target dir for build artefacts
BUILD_NR=${BUILD_NR:=$(date '+%Y%m%d-%H%M%S')}
BUILD_DEST=/builds/$BUILD_NR
mkdir -p $BUILD_DEST

# Create GO bootstrap files
cd /usr/local/go/src
export GOROOT_BOOTSTRAP=$(go env GOROOT)
GOOS=linux GOARCH=arm64 ./bootstrap.bash
GOOS=linux GOARCH=arm GOARM=6 ./bootstrap.bash
# List generated GO bootstrap files
cd ../..
ls go-linux-*-bootstrap.tbz
for file in go-linux-*-bootstrap.tbz; do
  # Create sha256sum
  sha256sum $file > $file.sha256
  # Copy build artefacts
  cp $file* $BUILD_DEST/
done

# List build artefacts
ls -al $BUILD_DEST/
