Pod::Spec.new do |s|
  s.name             = 'SuperSDK'
  s.version          = '1.0.0'
  s.summary          = 'Modular Super SDK'
  s.description      = 'Modular SDK with pluggable modules'
  s.homepage         = 'https://example.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael' => 'email@example.com' }
  s.source           = { :path => '.' }

  s.ios.deployment_target = '12.0'
  s.requires_arc = true

  # ----------------------------------------------------------
  #  SUBSPEC CORE
  # ----------------------------------------------------------
  s.subspec 'Core' do |sp|
    sp.source_files = 'SuperSDK_Core/**/*.{swift}'
  end

  # ----------------------------------------------------------
  #  SUBSPEC CHAT
  # ----------------------------------------------------------
  s.subspec 'Chat' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Chat/**/*.{swift}'
  end

  # ----------------------------------------------------------
  #  SUBSPEC LIVENESS
  # ----------------------------------------------------------
  s.subspec 'Liveness' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Liveness/**/*.{swift}'
  end

  # ----------------------------------------------------------
  #  SUBSPEC NETWORK
  # ----------------------------------------------------------
  s.subspec 'Network' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Network/**/*.{swift}'
  end

  # ----------------------------------------------------------
  #  MEGA Agregador — SuperSDK/All
  # ----------------------------------------------------------
  s.subspec 'All' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.dependency 'SuperSDK/Chat'
    sp.dependency 'SuperSDK/Liveness'
    sp.dependency 'SuperSDK/Network'

    # O agregador expõe um módulo único "SuperSDK"
    sp.source_files = 'SuperSDK_Entry/**/*.{swift}'
  end
end
