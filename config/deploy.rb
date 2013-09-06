require "bundler/capistrano"
require "rvm/capistrano"

set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.3-p448'
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

set :application, "tripclouds-finance-app"
set :repository,  "git@github.com:gilangmahardhika/tripcloud-finance.git"



set :scm, 'git'
set :user, "suitmedia"
role :web, "202.67.10.2"
role :app, "202.67.10.2"
role :db,  "202.67.10.2", :primary => true

set :deploy_to, "/home/#{user}/tripclouds"
set :use_sudo, false

set :rails_env, "production"
set :branch, "master"

set :deploy_via, :remote_cache

default_run_options[:pty] = true
ssh_options[:forward_agent] = true


namespace :deploy do

  desc 'Re-establish database.yml'
  task :set_database_symlink do
    run "ln -s /home/#{user}/tripclouds.database.yml #{current_release}/config/database.yml"
    # run "cp -pf /home/suitmedia/wartel.database.yml #{current_path}/config/database.yml"
  end

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
    # run "cd #{release_path} && bundle exec passenger stop -p 8814"
    # run "cd #{release_path} && bundle exec passenger start -p 8814 -e production --daemon"
    run "touch #{current_path}/tmp/restart.txt"
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

end

before "deploy:setup", "rvm:install_ruby"

after "deploy", "deploy:cleanup"
# after "deploy:set_database_symlink", "deploy:migrate"
before "deploy:assets:precompile", "deploy:set_database_symlink"
before "deploy:assets:precompile", "deploy:assets:clean"
before "deploy:migrate", "deploy:install_bundle"
before "deploy:restart", "deploy:migrate"
after "deploy:update_code", "deploy:symlink_uploads"
# after "deploy:update_code", "deploy:migrate"