platform :ios, '13.0'
use_frameworks!

target 'HappySwiftUI' do
    pod 'Highlightr', :git => 'git@github.com:brunophilipe/Highlightr.git', :branch => 'master'
    pod 'RealmSwift', :git => 'git@github.com:realm/realm-cocoa.git', :branch => 'master'
    pod 'Kingfisher', :git => 'git@github.com:onevcat/Kingfisher.git', :branch => 'master'
end


post_install do |installer|
     installer.pods_project.targets.each do |target|
         target.build_configurations.each do |config|
             config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
             config.build_settings['EXCLUDED_ARCHS[sdk=watchsimulator*]'] = 'arm64'
             config.build_settings['EXCLUDED_ARCHS[sdk=appletvsimulator*]'] = 'arm64'
    
         end
     end
 end
