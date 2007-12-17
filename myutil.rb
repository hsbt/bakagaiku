def add_load_path(path)
  $LOAD_PATH.unshift(path) unless $LOAD_PATH.member?(path)
end

def setup_environment
  require File.join(File.dirname(__FILE__), 'config/environment.rb')
  require 'test_help' if ENV['RAILS_ENV'] == 'test'
end

def database_configuration
  Rails::Configuration.new.database_configuration[ENV['RAILS_ENV'] || 'development']
end

def mysqldump(out_file = File.join(RAILS_ROOT, 'dbdump.sql'))
  `mysqldump -u#{database_configuration['username']} #{database_configuration['database']} > #{out_file}`
end
