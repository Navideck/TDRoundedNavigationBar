#
# Be sure to run `pod lib lint TDRoundedNavigationBar.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TDRoundedNavigationBar"
  s.version          = "1.0.0"
  s.summary          = "Custom UINavigationBar with rounded corners and many other features - written in Swift."
  s.description      = <<-DESC
Written for Swift2 and iOS 9
-------------

TDRoundedNavigationBar is an iOS UINavigationBar subclass that you can use in your own projects. It supercharges UINavigationBar with these features:

> **Features:**
> - **Rounded corners.** Round the corner's of your navigation bar using any radius. You can even leave the corners square by setting radius to zero.
> - **Custom bar height.** Make you navigation bar taller or shorter.
> - **Custom bar width.** Set the space you want to leave on the left and right of the navigation bar.
> - **Auto item positioning**. TDRoundedNavigationBar will position automatically every Navigation Bar element including title, back button or custom UIBarButtonItems to adapt to the custom size you 've set.
> - **Vertical Bar positioning.** Set the distance you want from the top of the screen when the status bar is hidden.
> - **iPhone and iPad support**.
> - **Supports any orientation** (portrait or landscape).
                       DESC
  s.homepage         = "https://github.com/Navideck/TDRoundedNavigationBar"
  # s.screenshots     = "https://raw.githubusercontent.com/Navideck/TDRoundedNavigationBar/master/TDRoundedNavigationBar.gif"
  s.license          = 'MIT'
  s.author           = { "Fotis Dimanidis" => "fotis@navideck.com" }
  s.source           = { :git => "https://github.com/Navideck/TDRoundedNavigationBar.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/navideck'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'TDRoundedNavigationBar' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
