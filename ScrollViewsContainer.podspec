Pod::Spec.new do |s|
  s.name             = 'ScrollViewsContainer'
  s.version          = '0.1.0'
  s.summary          = '.'

  s.homepage         = 'https://github.com/qwerkly/ScrollViewsContainer'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Quick Bird' => 'ivanprogun@gmail.com' }
  s.source           = { :git => 'https://github.com/qwerkly/ScrollViewsContainer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'

  s.source_files = 'Sources/ScrollViewsContainer/**/*'
end
