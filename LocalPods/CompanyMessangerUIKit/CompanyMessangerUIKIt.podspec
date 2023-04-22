Pod::Spec.new do |s|
    s.name          = 'CompanyMessangerUIKit'
    s.version       = '0.1.0'
    s.summary       = 'CompanyMessangerUIKit module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    s.ios.deployment_target = '15.0'
    s.source_files  = 'CompanyMessangerUIKit/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'CompanyMessangerUIKit' => [
            'CompanyMessangerUIKit/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'CompanyMessangerUIKit/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
end
