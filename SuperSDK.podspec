Pod::Spec.new do |s|
  s.name             = 'SuperSDK'
  s.version          = '1.0.4'
  s.summary          = 'Modular Super SDK with auto-registration'
  s.description      = 'Modules auto-register using static initializers; supports modular installation via subspecs.'
  s.homepage         = 'https://example.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rafael' => 'email@example.com' }

  # ESTE É O SOURCE CORRETO
  s.source = { :git => 'https://github.com/Rafaaaaeel/CocoapodsModular-SDK.git', :tag => s.version }

  s.ios.deployment_target = '12.0'
  s.requires_arc = true

  # ---------------------------------------------------------
  # NUNCA USE module_name EM SUBSPECS
  # Aqui você define o módulo Swift ÚNICO.
  # ---------------------------------------------------------
  s.module_name = 'SuperSDK'

  # ---------------- CORE ----------------
  s.subspec 'Core' do |sp|
    sp.source_files = 'SuperSDK_Core/**/*.{swift}'
  end

  # ---------------- CHAT ----------------
  s.subspec 'Chat' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Chat/**/*.{swift}'
  end

  # -------------- NETWORK ---------------
  s.subspec 'Network' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.source_files = 'SuperSDK_Network/**/*.{swift}'
  end

  # -------------- ALL (opcional) ---------
  s.subspec 'All' do |sp|
    sp.dependency 'SuperSDK/Core'
    sp.dependency 'SuperSDK/Chat'
    sp.dependency 'SuperSDK/Network'
    sp.source_files = 'SuperSDK_Entry/**/*.{swift}'
  end
end
