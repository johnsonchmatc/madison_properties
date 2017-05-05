server '162.243.116.46', user: 'deploy', roles: %w{web app db}

set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    user: 'deploy'
  }