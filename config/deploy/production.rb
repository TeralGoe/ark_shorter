set :stage, :production
server '92.53.91.210', user: 'deploy', roles: %w[web app db]
