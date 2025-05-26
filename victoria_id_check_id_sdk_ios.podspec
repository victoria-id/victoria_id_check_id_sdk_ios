Pod::Spec.new do |s|
  s.name             = 'victoria_id_check_id_sdk_ios'
  s.version          = '1.6.0'
  s.summary          = 'ID check from Victoria ID'
  s.homepage         = 'https://www.victoria-id.com/'
  s.author           = { 'Victoria-ID' => 'support@victoria-id.com' }
  s.source           = { :git => 'https://github.com/victoria-id/victoria_id_check_id_sdk_ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.ios.vendored_frameworks = 'Frameworks/victoria_id_check_id_sdk_ios.xcframework'

end
