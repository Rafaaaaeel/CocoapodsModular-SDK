Pod::Spec.new do |s|
  s.name             = 'SuperSDK'
  s.version          = '1.0.21'
  s.summary          = 'Modular Super SDK with ObjC loaders'
  s.description      = 'Automatic module registration via ObjC +load()'
  s.homepage         = 'https://example.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael' => 'email@example.com' }
  s.source           = { :git => 'https://github.com/Rafaaaaeel/CocoapodsModular-SDK.git', :tag => s.version }
  s.ios.deployment_target = '11.0'
  s.requires_arc = true

  s.subspec 'Core' do |sp|
    sp.static_framework = false
    sp.source_files = 'SuperSDK_Core/**/*.{swift,h,m}'
    sp.public_header_files = 'SuperSDK_Core/**/*.h'
  end

  s.subspec 'Chat' do |sp|
    sp.static_framework = false
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Chat/**/*.{swift,h,m}'
  end

  s.subspec 'Network' do |sp|
    sp.static_framework = false
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Network/**/*.{swift,h,m}'
  end

end
