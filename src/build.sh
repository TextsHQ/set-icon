#!/usr/bin/env sh

set -u

build() {
  arch=$1
  triple=$2
  outdir=dist
  out=$outdir/set-icon_$arch
  mkdir -p $outdir
  clang -mmacosx-version-min=10.11 -framework Cocoa src/set-icon.m -O2 -o $out -target $triple
  strip $out
}

build x64 x86_64-apple-macosx
build arm64 arm64-apple-macosx

lipo -create dist/set-icon_x64 dist/set-icon_arm64 -output dist/set-icon
strip dist/set-icon
ls -lah dist/set-icon
rm dist/set-icon_x64 dist/set-icon_arm64
