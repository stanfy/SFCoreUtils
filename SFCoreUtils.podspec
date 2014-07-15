Pod::Spec.new do |s|

  s.name         = 'SFCoreUtils'
  s.version      = '0.0.4'
  s.summary      = 'UIView Helpers, DateFormatters, Runtime.'

  s.homepage     = 'http://stanfy.com'
  s.license      = 'MIT'

  s.author       = { 'Paul Taykalo' => 'ptaykalo@stanfy.com.ua' }

  s.source       = { :git => 'https://github.com/stanfy/SFCoreUtils.git', :tag => '0.1.4' }

  s.platform     = :ios, '4.3'

  #s.source_files = 'Classes/**/*.{h,m}'
  s.requires_arc = true

  s.subspec 'UIView' do |sp|
    sp.source_files = 'Classes/UIView/*.{h,m}'
  end

  s.subspec 'Date' do |sp|
    sp.source_files = 'Classes/Dates/*.{h,m}'
  end

  s.subspec 'Runtime' do |sp|
    sp.source_files = 'Classes/Runtime/*.{h,m}'
  end

  s.subspec 'Non Retaining' do |sp|
    sp.source_files = 'Classes/NonRetaining/*.{h,m}'
  end

  s.subspec 'Strings' do |sp|
    sp.source_files = 'Classes/Strings/*.{h,m}'
  end

  s.subspec 'NSCoding' do |sp|
    sp.source_files = 'Classes/NSCoding/*.{h,m}'
  end

end

 
