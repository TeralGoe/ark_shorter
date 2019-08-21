require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
require 'capistrano/rails'
require 'capistrano/rails/collection'
require 'capistrano/passenger'
require 'capistrano/rbenv'

install_plugin Capistrano::SCM::Git

set :rbenv_type, :user
set :rbenv_ruby, '2.6.1'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
