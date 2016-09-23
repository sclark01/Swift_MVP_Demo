workspace 'MVP_Demo'
project 'MVP_Demo.xcodeproj'
platform :ios, '9.3'

use_frameworks!

def testing_pods
  pod 'Quick', '~> 0.10.0'
  pod 'Nimble', '~> 5.0.0'
  pod 'OHHTTPStubs'
  pod 'OHHTTPStubs/Swift'
end

def networking_pods
  pod 'Alamofire', '~> 4.0'
end

pod 'SwiftyJSON', '~> 3.0.0'

target 'MVP_Demo' do
  networking_pods
end

target 'MVP_DemoTests' do
  networking_pods
  testing_pods
end
