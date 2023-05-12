Pod::Spec.new do |s|
    s.name          = 'CatDetailed'
    s.version       = '0.1.0'
    s.summary       = 'ChatsList module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    s.ios.deployment_target = '15.0'
    s.source_files  = 'CatDetailed/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'CatDetailed' => [
            'CatDetailed/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'CatDetailed/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
    
    s.dependency 'Apexy'
    s.dependency 'CompanyMessangerCore'
    s.dependency 'CompanyMessangerResources'
    s.dependency 'CompanyMessangerUIKit'
    s.dependency 'SnapKit'
end
