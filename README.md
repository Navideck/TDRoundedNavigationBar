# TDRoundedNavigationBar

[![iOS 9+](https://img.shields.io/badge/platform-iOS%209%2B-blue.svg)](https://img.shields.io/badge/platform-iOS%209%2B-blue.svg)
[![Swift 3](https://img.shields.io/badge/language-swift3-f48041.svg)](https://img.shields.io/badge/language-swift3-f48041.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TDRoundedNavigationBar.svg)](https://img.shields.io/cocoapods/v/TDRoundedNavigationBar.svg)
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://img.shields.io/badge/license-MIT-lightgrey.svg)

![TDRoundedNavigationBar1](https://github.com/Navideck/TDRoundedNavigationBar/raw/master//Screenshots/TDRoundedNavigationBar1.png)
![TDRoundedNavigationBar2](https://github.com/Navideck/TDRoundedNavigationBar/raw/master/Screenshots/TDRoundedNavigationBar2.png)


**TDRoundedNavigationBar** is an iOS UINavigationBar subclass that you can use in your own projects. It supercharges UINavigationBar with these features:

- **Rounded corners.** Round the corner's of your navigation bar using any radius. You can even leave the corners square by setting radius to zero.
- **Custom bar height.** Make you navigation bar taller or shorter.
- **Custom bar width.** Set the space you want to leave on the left and right of the navigation bar.
- **Auto item positioning**. TDRoundedNavigationBar will position automatically every Navigation Bar element including title, back button or custom UIBarButtonItems to adapt to the custom size you 've set.
- **Vertical Bar positioning.** Set the distance you want from the top of the screen when the status bar is hidden.
- **iPhone and iPad support**.
- **Supports any orientation** (portrait or landscape).

## Installation

### Carthage
Add the following line to your Cartfile:

```github "Navideck/TDRoundedNavigationBar"```

### Cocoapods
Add the following line to your Podfile:

```pod "TDRoundedNavigationBar"```

### Manually
Drag `TDRoundedNavigationBar.swift` inside your project

-- or --

drag `TDRoundedNavigationBar.xcodeproj` as subproject and then add `TDRoundedNavigationBar` in `Target Dependencies` and in `Embedded Frameworks`

## Usage

*To run the example project, clone the repo, and run `pod install` from the Example directory first.*

For your own app, after you follow the installation instructions, either:

Through Interface Builder
> Open your Storyboard find your Navigation Bar (probably in your Navigation Controller) and set it's Class property and Module to "TDRoundedNavigationBar". That's it!

Through code 
> Instantiate using the **init(frame: CGRect)** method

## Requirements
Written in Swift 3 for iOS 9+

## Customization

You can customise the properties of TDRoundedNavigationBar. 

- **navBarHeight** sets the bar's height
- **navBarRadius** sets the corner radius
- **navBarSideSpacing** sets the spacing on the left and right
- **navBarSpacingWhenStatusBarHidden** sets the distance from the top of the screen when the status bar is hidden so that the bar has a nice floating effect.
- **corners** sets which corners will be rounded

## Author

Fotis Dimanidis, ([@fotiDim](http://twitter.com/fotidim)).

## License

TDRoundedNavigationBar is available under the MIT license. See the LICENSE file for more info.
