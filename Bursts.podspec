Pod::Spec.new do |s|
    s.name = 'Bursts'
    s.version = '1.0.1'
    s.summary = 'A Funny Framework for showing iOS 13 like system alerts'
    s.description = <<-DESC
    A Funny Framework is showing alerts, Have been Adapting Swift and SwiftUI.
    DESC
    s.homepage = 'https://github.com/Jovins/Bursts'
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    s.social_media_url = 'https://jovins.cn'
    s.authors = { 'Jovins' => 'https://jovins.cn' }
    s.module_name  = 'Bursts'
    s.source = { :git => 'https://github.com/Jovins/Bursts.git', :tag => s.version }
    s.source_files = 'Sources/**/*.swift'
    s.swift_versions = ['5.1', '5.2', '5.3']
    s.requires_arc = true
    s.ios.deployment_target = '10.0'
end