# UILabel-AutomaticWriting

[![Join the chat at https://gitter.im/alexruperez/UILabel-AutomaticWriting](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/alexruperez/UILabel-AutomaticWriting?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Twitter](http://img.shields.io/badge/contact-@alexruperez-blue.svg?style=flat)](http://twitter.com/alexruperez)
[![GitHub Issues](http://img.shields.io/github/issues/alexruperez/UILabel-AutomaticWriting.svg?style=flat)](http://github.com/alexruperez/UILabel-AutomaticWriting/issues)
[![CI Status](http://img.shields.io/travis/alexruperez/UILabel-AutomaticWriting.svg?style=flat)](https://travis-ci.org/alexruperez/UILabel-AutomaticWriting)
[![Version](https://img.shields.io/cocoapods/v/UILabel-AutomaticWriting.svg?style=flat)](http://cocoadocs.org/docsets/UILabel-AutomaticWriting)
[![License](https://img.shields.io/cocoapods/l/UILabel-AutomaticWriting.svg?style=flat)](http://cocoadocs.org/docsets/UILabel-AutomaticWriting)
[![Platform](https://img.shields.io/cocoapods/p/UILabel-AutomaticWriting.svg?style=flat)](http://cocoadocs.org/docsets/UILabel-AutomaticWriting)
[![Dependency Status](https://www.versioneye.com/user/projects/555b039a634daacd4100019b/badge.svg?style=flat)](https://www.versioneye.com/user/projects/555b039a634daacd4100019b)
[![Analytics](https://ga-beacon.appspot.com/UA-55329295-1/UILabel-AutomaticWriting/readme?pixel)](https://github.com/igrigorik/ga-beacon)

## Overview

UILabel category with automatic writing animation.

Inspired by [Google Trends - Hot Searches](http://www.google.com/trends/hottrends/visualize).

![UILabel-AutomaticWriting Screenshot](https://raw.githubusercontent.com/alexruperez/UILabel-AutomaticWriting/master/screenshot.gif)

Check out also the Android version created by my colleague [hrules6872](https://github.com/hrules6872)/[TrendTextView](https://github.com/hrules6872/TrendTextView).

### Installation

UILabel-AutomaticWriting is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "UILabel-AutomaticWriting"

#### Or you can add the following files to your project:
* `UILabel+AutomaticWriting.m`
* `UILabel+AutomaticWriting.h`

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### Or you can install it with Carthage:

    github "alexruperez/UILabel-AutomaticWriting"

### Example

```objectivec
[yourLabel setText:@"CHECK THIS!" automaticWritingAnimationWithBlinkingMode:UILabelAWBlinkingModeWhenFinishShowing];
```

#### You can customize the duration, the blinking character and even the blinking animation with:

```objectivec
UILabelAWBlinkingModeNone
UILabelAWBlinkingModeUntilFinish
UILabelAWBlinkingModeUntilFinishKeeping
UILabelAWBlinkingModeWhenFinish
UILabelAWBlinkingModeWhenFinishShowing
UILabelAWBlinkingModeAlways
```

#### You can fix blinking line break, setting edge insets with:

```objectivec
yourLabel.edgeInsets = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.2f);
```

# Etc.

* Contributions are very welcome.
* Attribution is appreciated (let's spread the word!), but not mandatory.

## Use it? Love/hate it?

Tweet the author [@alexruperez](http://twitter.com/alexruperez), and check out alexruperez's blog: http://alexruperez.com

## License

UILabel-AutomaticWriting is available under the MIT license. See the LICENSE file for more info.
