# encoding: utf-8

require 'net/http'
require 'nokogiri'
require 'tineye/client'

module TinEye
  class << Version = [1,0]
    def to_s; join ?. end
  end

module_function

  def search *args; client.search *args end
  def client; @instance ||= Client.new end
end
