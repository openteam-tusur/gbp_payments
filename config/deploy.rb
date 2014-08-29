require 'openteam/capistrano/deploy'

set :linked_files, fetch(:linked_files) + %w(db/production.sqlite3)
