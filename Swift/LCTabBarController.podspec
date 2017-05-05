Pod::Spec.new do |s|

  s.name         = "LCTabBarController"
  s.version      = "2.0.0"
  s.summary      = "A amazing and highly customized tabBarController! You could almost customize 100% of the properties! Support: http://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LCTabBarController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Leo" => "leodaxia@gmail.com" }
  s.social_media_url   = "https://LeoDev.me"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iTofu/LCTabBarController.git", :tag => s.version }
  s.source_files = "Sources/*.swift"
  # s.resource     = "Sources.bundle"
  s.requires_arc = true

  s.ios.deployment_target = "8.0"

  s.dependency "SnapKit", "~> 3.2.0"
  s.dependency "Then", "~> 2.1.0"

end
