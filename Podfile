# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AlkoScanner' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AlkoScanner
  # add the Firebase pod for Google Analytics
  pod 'Firebase/Analytics'
  # add pods for any other desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'Firebase/Database'
  
  # Updates deployment target for pods
  post_install do |pi|
      pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
      end
  end

end
