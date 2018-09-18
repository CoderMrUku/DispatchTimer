
Pod::Spec.new do |s|
  s.name             = 'XHGCDTimer'
  s.version          = '0.2.0'
  s.summary          = 'GCD定时器summary.'
  s.homepage         = 'https://github.com/CoderMrUku/XHGCDTimer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderMrUku' => 'houyue10@qq.com' }
  s.source           = { :git => 'https://github.com/CoderMrUku/XHGCDTimer.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'XHGCDTimer/Classes/**/*'
end
