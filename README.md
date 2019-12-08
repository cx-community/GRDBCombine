GRDBCombineX
===========

[GRDBCombine](https://github.com/groue/GRDBCombine) with lower version system support.

## Requirements

- Swift 5.0 (Xcode 11.0)

Note system Combine requires iOS 13.0 / macOS 10.15. For lower version system, open-source Combine can be used.

```
$ export CX_COMBINE_IMPLEMENTATION="CombineX"

# for CLI tools, execute with env variable
$ swift ...
$ xcodebuild ...

# for Xcode GUI, reopen Xcode with env variable
$ killall Xcode
$ open Package.swift
```

See [Combine Compatible Package](https://github.com/cx-org/CombineX/wiki/Combine-Compatible-Package)

## Usage

See [GRDBCombine](https://github.com/groue/GRDBCombine).