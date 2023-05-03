# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '15.0'

install! 'cocoapods',
         :warn_for_multiple_pod_sources => false,
         :generate_multiple_pod_projects => true,
         :incremental_installation => false,
         :warn_for_unused_master_specs_repo => false

use_frameworks!

workspace_name = 'CompanyMessanger'
workspace workspace_name

# LocalPods
pod 'CompanyMessangerCore', :path => 'LocalPods/CompanyMessangerCore'
pod 'CompanyMessangerUIKit', :path => 'LocalPods/CompanyMessangerUIKit'
pod 'CompanyMessangerResources', :path => 'LocalPods/CompanyMessangerResources'

pod 'ChatsList', :path => 'LocalPods/Features/ChatsList'
pod 'Home', :path => 'LocalPods/Features/Home'
pod 'Profile', :path => 'LocalPods/Features/Profile'

# ExternalPods
pod 'SnapKit', '~> 5.6.0'
pod 'Alamofire'

target 'CompanyMessanger' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  target 'CompanyMessangerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CompanyMessangerUITests' do
    # Pods for testing
  end

end
