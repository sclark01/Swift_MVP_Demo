workspace 'MVP_Demo'
project 'MVP_Demo.xcodeproj'
platform :ios, '9.3'

use_frameworks!

def testing_pods
  pod 'Quick', '~> 0.9.2'
  pod 'Nimble', '~> 4.0.1'
end

def networking_pods 
  pod 'Alamofire'
  pod 'SwiftyJSON'
end

target 'MVP_Demo' do
  networking_pods
end

target 'MVP_DemoTests' do
  testing_pods
end
