require "bundler/capistrano"
require "rvm/capistrano"

server "106.185.29.68", :web, :app, :db, primary: true
# set :default_shell, '/bin/bash -l'
set :default_environment, {
  'PATH' => "/opt/ruby-enterprise/bin/:$PATH"
}
set :application, "mentu"

set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:hzla00/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :shared_children, shared_children + %w{public/uploads}

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    # put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end

namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end

namespace :deploy do 
  task :console do 
    desc "Open the rails console on one of the remote servers"
    run "cd #{current_path}; bundle exec rails c RAILS_ENV=#{rails_env}"
  end
end

namespace :rails do
  desc "Open the rails console on one of the remote servers"
  task :console, :roles => :app do
    hostname = find_servers_for_task(current_task).first
    exec "ssh -l #{user} #{hostname} -t 'source ~/.profile && #{current_path}/script/rails c #{rails_env}'"
  end
end


namespace :custom do
  task :setup do
    run "cd #{current_path} && bundle exec rake db:create db:migrate RAILS_ENV=#{rails_env}"
  end
end

namespace :logs do
  desc "tail production log files"
  task :tail, roles: :app do
    file = fetch(:file, 'production') # uses 'production' as default
    trap("INT") { puts 'Interupted'; exit 0; }
    run "tail -f #{shared_path}/log/#{file}.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}"
      break if stream == :err
    end
  end
end