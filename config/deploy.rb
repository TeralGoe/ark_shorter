lock '3.11'

set :application, 'ark_shorter'
set :repo_url, 'git@github.com:TeralGoe/ark_shorter.git'
set :deploy_to, '/home/deploy/ark_shorter'
set :pty, true

append :linked_files, 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'
