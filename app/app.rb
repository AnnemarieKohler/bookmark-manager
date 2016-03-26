ENV['RACK_ENV'] ||='development'

require 'sinatra/partial'
require 'sinatra/base'
require 'sinatra/flash'

require 'bcrypt'

require_relative 'data_mapper_setup'

require_relative 'server'

require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
