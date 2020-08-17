Pod::Spec.new do |s|
  s.name             = 'RPHTTPServiceClient'
  s.version          = '1.0.0'
  s.summary          = 'RPHTTPServiceClient is a Type-safe JSON/HTTP client for iOS.'
  s.description      = <<-DESC
PiOSNetworkClient enables anyone to simplify the way to consume webservices/APIs and map automagically the results to ObjectMapper\'s Mappable object instances
                       DESC

  s.homepage         = 'https://github.com/RedP4nda/RPHTTPServiceClient'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MrCloud' => 'florianp37@me.com' }
  s.source           = { :git => 'https://github.com/RedP4nda/RPHTTPServiceClient.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Florian_MrCloud'

  s.ios.deployment_target = '11.0'

  s.source_files = 'RPHTTPServiceClient/Classes/**/*'

    s.dependency 'Moya', '14.0.0'
    s.dependency 'Moya-ObjectMapper', '2.9'
    s.dependency 'ObjectMapper', '3.5.1'
    s.dependency 'Alamofire', '5.0.0'
end

