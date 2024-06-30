#
# Be sure to run `pod lib lint FFLumberjack.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FFLumberjack'
  s.version          = '1.0.0'
  s.summary          = 'A logging framework based on CocoaLumberjack'
  s.description      = <<-DESC
                        A logging framework based on CocoaLumberjack.
                        Enable you to output logs without making any settings.
                        And it is easy to import globally
                       DESC
  s.homepage         = 'https://github.com/findingfield/FFLumberjack'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'findingfield' => 'findingfield@qq.com' }
  s.source           = { :git => 'https://github.com/findingfield/FFLumberjack.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '11.0'
  s.swift_versions = ["5"]
  s.source_files = 'FFLumberjack/Classes/**/*'
  # s.resource_bundles = {
  #   'FFLumberjack' => ['FFLumberjack/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation'
  s.dependency 'CocoaLumberjack/Swift', '3.8.5'
  
end
