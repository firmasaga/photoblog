#############################################################
# 	Application setup
#############################################################

set :application, "photoblog"
set :deploy_to, "/var/www/#{application}"
set :rails_env, "development"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
set :use_sudo, false
set :keep_releases, 2

#############################################################
#	Servers
#############################################################

set :user, "dev"
set :domain, "urmada.dyndns.org"
role :app, domain
role :web, domain
role :db, domain, :primary => true

#############################################################
#	Subversion
#############################################################

set :repository,  "git://github.com/firmasaga/photoblog.git" #"git@#{domain}:#{application}.git"
set :scm, :git
set :scm_username, user
set :runner, user
set :use_sudo, false
set :branch, "master"
set :deploy_via, :checkout
set :git_shallow_clone, 1
set :deploy_to, "/var/www/#{application}"
default_run_options[:pty] = true

#set :repository,  "git@urmada.dyndns.org:cloudleaves.git"
#set :checkout, "export"

#############################################################
#	Passenger
#############################################################

desc "Restart Application"
namespace :deploy do
  task :restart, :roles => [:app, :web] do
    #after :deploy, "sphinx:index"
    #after :deploy, "sphinx:restart"
    after :deploy, "deploy:cleanup"
    run "touch #{current_path}/tmp/restart.txt"
  end
end


############################################################
#       Database config setup
############################################################

desc "Set up shared directories after setup of capistrano"
task :after_setup, :roles => [:app, :web] do
  #run "mkdir -p -m 775 #{shared_path}/sphinx"
  #sphinx::start
  #run "#{current_path}/rake gems:install"
  run "#{current_path}/rake db:admin:create"
end

task :after_update_code, :roles => [:app, :web] do
  # symlink database.yml (it must be release_path, not current_path!)
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  #run "ln -nfs #{shared_path}/public/sources #{release_path}/public/sources"

end

desc "Symlink the shared directories after every deploy"
task :after_symlink, :roles => [:app, :web] do
  # Sphinx index
  #run "rm -rf #{current_path}/db/sphinx"
  #run "ln -nfs #{shared_path}/sphinx #{current_path}/db/sphinx"
  # symlink database.yml (it must be release_path, not current_path!)
  #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"

  # Paperclip images
  #run "mkdir -p -m 775 #{release_path}/public/paperclip"
  #run "ln -nfs #{shared_path}/public/videos/paperclip #{current_path}/public/paperclip"

end
