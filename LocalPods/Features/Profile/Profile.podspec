Pod::Spec.new do |s|
    s.name          = 'Profile'
    s.version       = '0.1.0'
    s.summary       = 'Profile module.'
    
    s.homepage      = 'https://github.com/anisimovgnVT191/Diplom'
    s.author        = { 'Anisimov Georgiy' => 'hollywoodstreets23@gmail.com' }
    s.source        = { :path => '*' }
    s.ios.deployment_target = '15.0'
    s.source_files  = 'Profile/Classes/**/*.{swift,m,h}'
    s.resource_bundles = {
        'Profile' => [
            'Profile/Classes/**/*.{json,plist,xib,storyboard,bundle}',
            'Profile/Resources/**/*.{xcassets,strings,stringsdict}'
      ]
    }
end
