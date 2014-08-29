require 'capistrano/setup'
require 'capistrano/deploy'

require 'airbrake/capistrano3'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rvm'
require 'capistrano3/unicorn'
require 'openteam/capistrano/tasks'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
