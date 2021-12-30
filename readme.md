# set-icon

Node.js wrapper around [NSWorkspace.setIcon(_:forFile:options:)](https://developer.apple.com/documentation/appkit/nsworkspace/1529882-seticon) with a [prebuilt binary](./dist/set-icon). You can use this to change icons for .apps.

## Install
```sh
yarn add set-icon
# or
npm install set-icon
```

## CLI usage
```sh
set-icon <file_path> <icon_path> # to change
set-icon <file_path>             # to reset
```

## Usage
```typescript
import setIcon from 'set-icon'

// to change
await setIcon('/Applications/Foo.app', 'icon.png')
// to reset
await setIcon('/Applications/Foo.app', null)
```
