Pod::Spec.new do |s|
    s.name          = 'CompanyMessangerResources'
    s.version       = '0.1.0'
    s.summary       = 'CompanyMessangerResources module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    
    s.ios.deployment_target = '15.0'
    
    s.source_files  = 'CompanyMessangerResources/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'CompanyMessangerResources' => [
            'CompanyMessangerResources/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'CompanyMessangerResources/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
    
    s.dependency 'CompanyMessangerCore'
end
