# TDRoundedNavigationBar

[![Version](https://img.shields.io/cocoapods/v/TDRoundedNavigationBar.svg?style=flat)](http://cocoapods.org/pods/TDRoundedNavigationBar)
[![License](https://img.shields.io/cocoapods/l/TDRoundedNavigationBar.svg?style=flat)](http://cocoapods.org/pods/TDRoundedNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/TDRoundedNavigationBar.svg?style=flat)](http://cocoapods.org/pods/TDRoundedNavigationBar)

![TDRoundedNavigationBar1](https://github.com/Navideck/TDRoundedNavigationBar/raw/master/TDRoundedNavigationBar1.png)
![TDRoundedNavigationBar2](https://github.com/Navideck/TDRoundedNavigationBar/raw/master/TDRoundedNavigationBar2.png)

**TDRoundedNavigationBar** is an iOS UINavigationBar subclass that you can use in your own projects. It supercharges UINavigationBar with these features:

- **Rounded corners.** Round the corner's of your navigation bar using any radius. You can even leave the corners square by setting radius to zero.
- **Custom bar height.** Make you navigation bar taller or shorter.
- **Custom bar width.** Set the space you want to leave on the left and right of the navigation bar.
- **Auto item positioning**. TDRoundedNavigationBar will position automatically every Navigation Bar element including title, back button or custom UIBarButtonItems to adapt to the custom size you 've set.
- **Vertical Bar positioning.** Set the distance you want from the top of the screen when the status bar is hidden.
- **iPhone and iPad support**.
- **Supports any orientation** (portrait or landscape).

## Installation

TDRoundedNavigationBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

> ```pod "TDRoundedNavigationBar"```

or if you don't want to use CocoaPods:

> 'Drag the "TDRoundedNavigationBar.swift" file inside your project

## Usage

*To run the example project, clone the repo, and run `pod install` from the Example directory first.*

For your own app, after you follow the installation instructions, either:

Through Interface Builder
> Open your Storyboard find your Navigation Bar (probably in your Navigation Controller) and set it's Custom Class property to "TDRoundedNavigationBar". That's it!

Through code 
> Instantiate using the **init(frame: CGRect)** method

## Requirements
Written for Swift 2 and iOS 9

## Customization

You can customise the properties of TDRoundedNavigationBar inside TDRoundedNavigationBar.swift. 

- **navBarHeight** sets the bar's height
- **navBarRadius** sets the corner radius
- **navBarSideSpacing** set the spacing on the left and right
- **navBarSpacingWhenStatusBarHidden** set the distance from the top of the screen when the status bar is hidden so that the bar has a nice floating effect.

## Author

Fotis Dimanidis, ([@fotiDim](http://twitter.com/fotidim)).

## License

TDRoundedNavigationBar is available under the MIT license. See the LICENSE file for more info.
