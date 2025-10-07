Pod::Spec.new do |sdk|

  sdk.name             = 'victoria_id_check_id_sdk_ios'
  sdk.version          = '1.11.1'
  sdk.summary          = 'Victoria-ID - ID check - SDK - iOS'

  sdk.homepage         = 'https://www.victoria-id.com/'
  sdk.author           = { 'Victoria-ID' => 'support@victoria-id.com' }
  sdk.source           = { :git => 'https://github.com/victoria-id/victoria_id_check_id_sdk_ios.git', :tag => sdk.version.to_s }

  sdk.ios.deployment_target = '15.0'
  sdk.ios.vendored_frameworks = 'Frameworks/victoria_id_check_id_sdk_ios.xcframework'

  sdk.dependency "iProov", '12.5.0'
  sdk.dependency "NFCPassportReader", '2.1.2'

end
