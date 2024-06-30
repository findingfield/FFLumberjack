# FFLumberjack

[![CI Status](https://img.shields.io/travis/findingfield/FFLumberjack.svg?style=flat)](https://travis-ci.org/findingfield/FFLumberjack)
[![Version](https://img.shields.io/cocoapods/v/FFLumberjack.svg?style=flat)](https://cocoapods.org/pods/FFLumberjack)
[![License](https://img.shields.io/cocoapods/l/FFLumberjack.svg?style=flat)](https://cocoapods.org/pods/FFLumberjack)
[![Platform](https://img.shields.io/cocoapods/p/FFLumberjack.svg?style=flat)](https://cocoapods.org/pods/FFLumberjack)

[中文介绍点这里](README_CN.md)

##  Introduction

FFLumberjack is based on [CocoaLumberjack](https://github.com/CocoaLumberjack/CocoaLumberjack), and encapsulated it:
1. The default initialization settings are automatically set and you can use it directly without any settings;
2. Unified setting of log format: "Date file line-count: Content": "2024.06.30-17:06:52:151 ViewController 21: Are You OK?";
3. The log file name has been uniformly set as "CFBundleName-Time.log": "Example-2024.06.30-15.50.30.log".
And it can be imported only once for global use without polluting the namespace.

## Installation

### 1. CocoaPods
FFLumberjack can be installed through [CocoaPods](https://cocoapods.org). In Podfile, just add the following lines:

```ruby
pod 'FFLumberjack'
```
Then execute in the terminal:
```shell
pod install
```

### 2.  Swift Package Manager
FFLumberjack can be installed through [Swift Package Manager](https://www.swift.org/documentation/package-manager/). URL:
```
https://github.com/findingfield/FFLumberjack.git
```

## Usage

FFLumberjack is very easy to use, first import the library and then give an alias:

```Swift
import FFLumberjack

typealias MyLog = FFLumberjack
```
Then you can use MyLog anywhere in your project:
```Swift
MyLog.verbose("verbose")
MyLog.debug("debug")
MyLog.info("info")
MyLog.warn("warn")
MyLog.error("error")
```

## Author

findingfield, findingfield@qq.com

## License

FFLumberjack is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
