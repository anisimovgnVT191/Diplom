Pod::Spec.new do |s|
    s.name          = 'CompanyMessangerCore'
    s.version       = '0.1.0'
    s.summary       = 'CompanyMessangerCore module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    
    s.ios.deployment_target = '15.0'
    
    s.source_files  = 'CompanyMessangerCore/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'CompanyMessangerCore' => [
            'CompanyMessangerCore/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'CompanyMessangerCore/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
    
    s.dependency 'Alamofire'
    s.dependency 'AlamofireImage'
end
