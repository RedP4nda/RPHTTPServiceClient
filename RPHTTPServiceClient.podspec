Pod::Spec.new do |s|
  s.name             = 'RPHTTPServiceClient'
  s.version          = '0.11.1'
  s.summary          = 'RPHTTPServiceClient is a Type-safe JSON/HTTP client for iOS.'
  s.description      = <<-DESC
PiOSNetworkClient enables anyone to simplify the way to consume webservices/APIs and map automagically the results to ObjectMapper\'s Mappable object instances
                       DESC

  s.homepage         = 'https://github.com/RedP4nda/RPHTTPServiceClient'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MrCloud' => 'florianp37@me.com' }
  s.source           = { :git => 'https://github.com/RedP4nda/RPHTTPServiceClient.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Florian_MrCloud'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RPHTTPServiceClient/Classes/**/*'

    s.dependency 'Moya', '11.0.2'
    s.dependency 'Moya-ObjectMapper', '2.6'
    s.dependency 'ObjectMapper', '3.2'
    s.dependency 'Alamofire', '4.4'
end
