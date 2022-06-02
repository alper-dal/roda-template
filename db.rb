begin
  require_relative '.env.rb'
rescue LoadError
end

require 'sequel/core'

DB = Sequel.connect(ENV.delete('DATABASE_URL'))

# Load Sequel Database/Global extensions here
# DB.extension :date_arithmetic
