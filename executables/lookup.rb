#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/../library'
require 'tineye'

TinEye.search('http://gfx.newz.cdn.zfour.dk/81/16881-250x156crop0.png').each do |result|
  puts "==> #{result[:host]} - #{result[:direct]}"
end
