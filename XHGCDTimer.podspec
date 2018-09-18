
Pod::Spec.new do |s|
  s.name             = 'XHGCDTimer'
  s.version          = '0.1.0'
  s.summary          = 'GCD timer is better.'

  s.description      = <<-DESC
    GCD timer, bla bla bla ...
                      DESC

  s.homepage         = 'https://github.com/CoderMrUku/XHGCDTimer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderMrUku' => 'houyue10@qq.com' }
  s.source           = { :git => 'https://github.com/CoderMrUku/XHGCDTimer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'XHGCDTimer/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
