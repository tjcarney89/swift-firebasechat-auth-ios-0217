# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def commonPods
    pod 'Firebase'
    pod 'Firebase/Auth'
    pod 'GoogleSignIn'
    pod 'JSQMessagesViewController'
end

target 'Firechat' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  commonPods
  
  # Pods for Firechat

  target 'FirechatTests' do
    inherit! :search_paths
    commonPods
    # Pods for testing
  end
  
  

end
