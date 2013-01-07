#!/usr/bin/env ruby
require 'thor'
require './lib/openplay/client'

module Openplay
  class CLI < Thor
    desc "throw", "Throw video"
    def throw(receiver)
      puts "I'm throwing to #{receiver}"
      @client = ::Openplay::Client.new(receiver)
      @client.throw
    end
  end
end

Openplay::CLI.start
