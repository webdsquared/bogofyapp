#set :bundle_cmd, "/usr/local/rvm/gems/ruby-1.9.3-p392@global"
#set :bundle_dir, "/usr/local/rvm/gems/ruby-1.9.3-p392"

require "bundler/capistrano"

server "192.81.219.54", :web, :app, :db, primary: true

set :application, "bogofyapp"
set :user, "aaron"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "https://github.com/webdsquared/#{application}.git"
set :branch, "master"

set :default_environment, {
	'PATH' => "/home/aaron/.rvm/gems/ruby-1.9.3-p392/bin:/home/aaron/.rvm/gems/ruby-1.9.3-p392@global/bin:/home/aaron/.rvm/rubies/ruby-1.9.3-p392/bin:/home/aaron/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
	'RUBY_VERSION' => '1.9.3p392',
	'GEM_HOME' => '/home/aaron/.rvm/gems/ruby-1.9.3-p392',
	'GEM_PATH' => '/home/aaron/.rvm/gems/ruby-1.9.3-p392:/home/aaron/.rvm/gems/ruby-1.9.3-p392@global'
}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" #keep only the last 5 releases


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
