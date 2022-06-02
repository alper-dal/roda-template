case ENV['RACK_ENV'] ||= 'development'
when 'test'
  ENV['DATABASE_URL'] ||= "postgres:///roda_test?user=alperdal"
when 'production'
  ENV['DATABASE_URL'] ||= "postgres:///roda_production?user=alperdal"
else
  ENV['DATABASE_URL'] ||= "postgres:///roda_development?user=alperdal"
end