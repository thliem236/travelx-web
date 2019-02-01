server ENV['TRAVELX_STAGING_SERVER'], port: 22, roles: [:web, :app, :db], primary: true

set :user, ENV['TRAVELX_USER_DEPLOY']

set :ssh_options,     {
    forward_agent: true,
    user: fetch(:user),
    keys: [ENV['TRAVELX_PRODUCTION_KEY']],
    auth_methods: %w(publickey)
}

set :puma_threads, [1, 6]
set :puma_workers, 1
set :stage, :production
set :puma_workers, ENV['TRAVELX_PRODUCTION_CPU_CORE_NUMBER']
