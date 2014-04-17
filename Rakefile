# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|

  app.provisioning_profile='iOS_Team_Provisioning_Profile_.mobileprovision'
  app.codesign_certificate='iPhone Developer: Shogo Kawaguchi (J73A32F4KP)'

  app.name = 'MotionRSS'
end
task :"build:simulator" => :"schema:build"
