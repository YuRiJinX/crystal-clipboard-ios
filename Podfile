source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/jzzocc/Specs.git'

platform :ios, '11.0'

use_frameworks!

plugin 'cocoapods-keys', {
  project: 'CrystalClipboard',
  keys: %w[
    CrystalClipboardStagingAdminAuthToken
    CrystalClipboardProductionAdminAuthToken
  ]
}

target 'CrystalClipboard' do
  pod 'CellHelpers', '~> 0.5'
  pod 'KeychainAccess', '~> 3.1'
  pod 'Moya/ReactiveSwift', '~> 11.0'
  pod 'PKHUD', '5.0'
  pod 'ReactiveCocoa', '~> 7.1'
  pod 'Starscream', '~> 3.0'
  target 'CrystalClipboardTests'
  target 'CrystalClipboardUITests'
end
