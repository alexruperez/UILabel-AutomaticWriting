Pod::Spec.new do |s|
  s.name             = "UILabel-AutomaticWriting"
  s.version          = "0.1.3"
  s.summary          = "UILabel category with automatic writing animation."
  s.homepage         = "https://github.com/alexruperez/UILabel-AutomaticWriting"
  s.screenshots      = "https://raw.githubusercontent.com/alexruperez/UILabel-AutomaticWriting/master/screenshot.gif", "https://raw.githubusercontent.com/alexruperez/UILabel-AutomaticWriting/master/screenshot.jpg"
  s.license          = 'MIT'
  s.author           = { "alexruperez" => "contact@alexruperez.com" }
  s.source           = { :git => "https://github.com/alexruperez/UILabel-AutomaticWriting.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexruperez'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'UILabel-AutomaticWriting/*.{h,m,swift}'

  s.frameworks = 'UIKit'
end
