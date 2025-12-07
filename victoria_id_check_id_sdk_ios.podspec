Pod::Spec.new do |sdk|

  sdk.name             = 'victoria_id_check_id_sdk_ios'
  sdk.version          = '1.13.0'
  sdk.summary          = 'Victoria-ID - ID check - SDK - iOS'
  sdk.license          = { :type => 'commercial', :file => 'license.md' }

  sdk.homepage         = 'https://www.victoria-id.com/'
  sdk.author           = { 'Victoria-ID' => 'support@victoria-id.com' }
  sdk.source           = { :git => 'https://github.com/victoria-id/victoria_id_check_id_sdk_ios.git', :tag => sdk.version.to_s }

  sdk.swift_versions = ['6.0']
  sdk.ios.deployment_target = '15.0'
  sdk.ios.vendored_frameworks = 'Frameworks/victoria_id_check_id_sdk_ios.xcframework'

  sdk.dependency 'iProov', '13.0.0'
  sdk.dependency 'OpenSSL-Universal', '3.3.3001'
  sdk.dependency 'victoria_id_check_id_sdk_tesseract_ios', '5.5.0'

end
