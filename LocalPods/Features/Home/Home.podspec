Pod::Spec.new do |s|
    s.name          = 'Home'
    s.version       = '0.1.0'
    s.summary       = 'Home module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    s.ios.deployment_target = '15.0'
    s.source_files  = 'Home/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'Home' => [
            'Home/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'Home/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
end
