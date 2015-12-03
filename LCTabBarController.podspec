Pod::Spec.new do |s|

  s.name         = "LCTabBarController"
  s.version      = "1.0.0"
  s.summary      = "A amazing and highly customized tabBarController! You could almost customize 100% of the properties with LCTabBarController! Support: http://www.leodong.com"
  s.homepage     = "https://github.com/LeoiOS/LCTabBarController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Leo" => "leoios@sina.com" }
  s.social_media_url   = "http://www.leodong.com"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/LeoiOS/LCTabBarController.git", :tag => s.version }
  s.source_files  = "LCTabBarController/**/*.{h,m}"
  s.resource     = 'LCTabBarController/LCTabBarController.bundle'
  s.requires_arc = true

end
