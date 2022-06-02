# frozen_string_literal: true

require_relative 'models'

require 'roda'

class App < Roda
  plugin :hash_routes
  # TODO: Not sure if these are required?
  # opts[:check_dynamic_arity] = false
  # opts[:check_arity] = :warn

  logger = if ENV['RACK_ENV'] == 'test'
             Class.new { def write(_) end }.new
           else
             $stderr
           end
  plugin :common_logger, logger

  plugin :not_found do
    "Not Found"
  end

  # unless ENV['RACK_ENV'] == 'development'
  #   def self.freeze
  #     Sequel::Model.freeze_descendents
  #     DB.freeze
  #     super
  #   end
  # end

  plugin :error_handler do |e|
    $stderr.print "#{e.class}: #{e.message}\n"
    $stderr.puts e.backtrace
    "Internal Server Error"
  end

  plugin :json, classes: [Array, Hash, Sequel::Model], content_type: 'application/json'
  plugin :json_parser

  Unreloader.require('controllers') { }

  route do |r|
    r.root do
      r.redirect "/health"
    end

    r.is "health" do
      r.get do
        response.status = 200
        { "health": 'good' }
      end
    end

    # Controllers
    r.hash_routes
  end
end
