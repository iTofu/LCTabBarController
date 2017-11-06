Pod::Spec.new do |s|

  s.name         = "LCTabBarController"
  s.version      = "1.3.8"
  s.summary      = "A amazing and highly customized tabBarController! You could almost customize 100% of the properties! Support: http://LeoDev.me"
  s.homepage     = "https://github.com/iTofu/LCTabBarController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Leo" => "leodaxia@gmail.com" }
  s.social_media_url   = "http://LeoDev.me"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iTofu/LCTabBarController.git", :tag => s.version }
  s.source_files = "LCTabBarController/**/*.{h,m}"
  s.resource     = 'LCTabBarController/LCTabBarController.bundle'
  s.requires_arc = true

end
