# Bundler Integration
require "bundler/capistrano"
require "rvm/capistrano"
 
# Application Settings
set :application,   "tripcloud-finance"
set :user,          "suitmedia"
set :deploy_to,     "/home/#{user}/#{application}"
set :rails_env,     "production"
set :use_sudo,      false
set :keep_releases, 3

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p374'
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
 
# Git Settings
set :scm,           :git
set :branch,        "master"
set :repository,    "git@github.com:gilangmahardhika/tripcloud-finance.git"
set :deploy_via,    :remote_cache
 
# Uses local instead of remote server keys, good for github ssh key deploy.
ssh_options[:forward_agent] = true
 
# Server Roles
role :web, "202.67.10.2"
role :app, "202.67.10.2"
role :db,  "202.67.10.2", :primary => true
 

namespace :deploy do
	desc 'run bundle install'
	task :install_bundle do
	  run "cd #{current_path} && bundle install"
	end

	desc 'run the migration'
	task :migrate do
	  run "cd #{current_path} && bundle exec rake db:create RAILS_ENV=production --trace"
	  run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=production --trace"
	end

	desc 'symlink upload folder'
	task :symlink_uploads do
	  run "rm -rf #{release_path}/public/uploads} && ln -nfs #{shared_path}/uploads  #{release_path}/public/uploads"
	end

	desc "create uploads folder"
	task :create_uploads_folder do
	  run "mkdir #{shared_path}/uploads"
	  run "chmod 777 -R #{shared_path}/uploads"
	end


	task :restart, :roles => :app, :except => { :no_release => true } do
	  run "cd #{release_path} && bundle exec passenger stop -p 8814"
	  run "cd #{release_path} && bundle exec passenger start -p 8814 -e production --daemon"
	  # run "touch #{current_path}/tmp/restart.txt"
	end

	task :start_server, :roles => :app, :except => { :no_release => true } do
	  # run "cd #{release_path} && bundle exec passenger stop -p 8814"
	  run "cd #{release_path} && bundle exec passenger start -p 8814 -e production --daemon"
	  # run "touch #{current_path}/tmp/restart.txt"
	end

	desc "drop DB"
	task :drop_db do
	  run "cd #{current_path} && bundle exec rake db:drop RAILS_ENV=production --trace"
	end

	desc "Restart passenger process"
	task :restart, :roles => :app, :except => { :no_release => true } do
	  run "touch #{current_path}/tmp/restart.txt"
	end
	
	[:start, :stop].each do |t|
	  desc "#{t} does nothing for passenger"
	  task t, :roles => :app do ; end
	end

end

before "deploy:setup", "db:configure"
after  "deploy:update_code", "db:symlink"

after "deploy", "deploy:cleanup"
# after "deploy:set_database_symlink", "deploy:migrate"
before "deploy:assets:precompile", "db:symlink"
# before "deploy:assets:precompile", "deploy:assets:clean"
before "deploy:migrate", "deploy:install_bundle"
before "deploy:restart", "deploy:migrate"
after "deploy:update_code", "deploy:symlink_uploads"
# after "deploy:update_code", "deploy:migrate"
 
namespace :db do
  desc "Create database yaml in shared path"
  task :configure do
    set :database_username do
      "root"
    end
 
    set :database_password do
      Capistrano::CLI.password_prompt "Database Password: "
    end
 
    db_config = <<-EOF
      base: &base
        adapter: mysql2
        encoding: utf8
        reconnect: false
        pool: 5
        username: #{database_username}
        password: #{database_password}
 
      development:
        database: #{application}_development
        <<: *base
 
      test:
        database: #{application}_test
        <<: *base
 
      production:
        database: #{application}_production
        <<: *base
    EOF
 
    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end
 
  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  end
end