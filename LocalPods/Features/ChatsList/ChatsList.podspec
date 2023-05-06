Pod::Spec.new do |s|
    s.name          = 'ChatsList'
    s.version       = '0.1.0'
    s.summary       = 'ChatsList module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    s.ios.deployment_target = '15.0'
    s.source_files  = 'ChatsList/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'ChatsList' => [
            'ChatsList/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'ChatsList/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
    
    s.dependency 'CompanyMessangerResources'
    s.dependency 'CompanyMessangerUIKit'
    s.dependency 'SnapKit'
end
