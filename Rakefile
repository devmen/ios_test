# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'formotion'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Test'
  app.libs << ['/usr/lib/libz.1.1.3.dylib', '/usr/lib/libsqlite3.dylib']
  app.frameworks += %w(StoreKit AudioToolbox CFNetwork SystemConfiguration MobileCoreServices Security QuartzCore AdSupport Social)
  app.vendor_project('vendor/Parse.framework', :static, :products => ['Parse'], :headers_dir => 'Headers')
end
