
Pod::Spec.new do |s|
  s.name             = 'SuperSDK'
  s.version          = '1.0.0'
  s.summary          = 'Modular Super SDK with auto-registration'
  s.description      = 'Modules auto-register using static initializers; supports modular installation via subspecs.'
  s.homepage         = 'https://example.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.ios.deployment_target = '12.0'
  s.requires_arc = true

  s.subspec 'Core' do |sp|
    sp.source_files = 'SuperSDK_Core/**/*.{swift}'
  end

  s.subspec 'Network' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Network/**/*.{swift}'
  end

  s.subspec 'Chat' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Chat/**/*.{swift}'
  end

  s.subspec 'All' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.dependency 'SuperSDK/Network'
    sp.dependency 'SuperSDK/Chat'
    sp.source_files = 'SuperSDK_Entry/**/*.{swift}'
  end
end
