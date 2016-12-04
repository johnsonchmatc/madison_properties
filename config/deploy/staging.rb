server 'madison-property.local', user: 'deploy', roles: %{app db web}

set :ssh_options, {
    #keys: %w(/home/action/.ssh/id_rsa),
    forward_agent: true,
    user: 'deploy'
  }
