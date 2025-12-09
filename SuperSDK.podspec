Pod::Spec.new do |s|
  s.name             = 'SuperSDK'
  s.version          = '1.0.13'
  s.summary          = 'Modular Super SDK'
  s.description      = 'Automatic module registration via ObjC load().'
  s.homepage         = 'https://example.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael' => 'email@example.com' }

  s.source = { :git => 'https://github.com/Rafaaaaeel/CocoapodsModular-SDK.git', :tag => s.version }
  s.ios.deployment_target = '12.0'
  s.requires_arc = true

  # UM ÚNICO MÓDULO SWIFT, sempre.
  s.module_name = 'SuperSDK'

  s.subspec 'Core' do |sp|
    sp.source_files = 'SuperSDK_Core/**/*.{swift}'
    core.public_header_files = "SuperSDK_Core/**/*.h"
  end

  s.subspec 'Chat' do |chat|
    chat.source_files = 'SuperSDK_Chat/**/*.{swift,m,h}'
    chat.dependency 'SuperSDK/Core'
  end

  s.subspec 'Network' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Network/**/*.{swift}'
  end

  s.subspec 'All' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.dependency 'SuperSDK/Chat'
    sp.dependency 'SuperSDK/Network'
    sp.source_files = 'SuperSDK_Entry/**/*.{swift}'
  end
end
