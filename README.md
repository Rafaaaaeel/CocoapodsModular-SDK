
SuperSDK - Modular CocoaPods-ready SDK
=====================================

Folder structure:
- SuperSDK.podspec
- SuperSDK_Core/
- SuperSDK_Network/
- SuperSDK_Chat/
- SuperSDK_Entry/
- LICENSE

How to use locally:
1) Unzip this package next to your iOS project:
   /path/to/YourApp/
     - SuperSDK/   <- this folder
     - YourApp/    <- your app project

2) Podfile example (install only Network + Core):
   platform :ios, '12.0'
   use_frameworks! :linkage => :static

   target 'YourApp' do
     pod 'SuperSDK/Core', :path => '../SuperSDK'
     pod 'SuperSDK/Network', :path => '../SuperSDK'
   end

3) In your app code:
   import SuperSDK

   // Start the SDK (will execute only installed modules)
   SuperSDKMain.start()

Notes:
- Do not include .framework/.xcframework artifacts in the SDK repo. This package ships source modules only.
- If you publish to GitHub, prefer tagging releases and using :git => 'https...' and :tag => '1.0.0' in the Podfile.
