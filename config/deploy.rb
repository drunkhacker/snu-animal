set :application, "snu-animal"
set :scm, :git
set :repository,  "git@github.com:drunkhacker/snu-animal.git"
set :branch, "master"

set :user, "zoo"
set :rails_env, "production"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "zoo.snu.ac", :app, :web, :db, :primary => true
set :use_sudo, false
set :deploy_to, "/deploy/snu-animal"
set :deploy_via, :copy
#set :deploy_via, :remote_cache
#set :git_shallow_clone, 1

role :web, "zoo.snu.ac"                          # Your HTTP server, Apache/etc
role :app, "zoo.snu.ac"                          # This may be the same as your `Web` server
role :db,  "zoo.snu.ac", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:postconfigure"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :postconfigure do
    # symlink database.yml: copy if not exists, then link it back (release/config/database.yml -> shared/database.yml)
    run "cp -n #{release_path}/config/database.yml #{shared_path}"
    run "ln -sf #{shared_path}/database.yml #{release_path}/config/database.yml"
    # symlink database file and backup current one
    run "ln -sf #{shared_path}/production.sqlite3 #{release_path}/db/production.sqlite3"
    run "touch #{release_path}/db/production.sqlite3" # make sure at least empty file exists so it can be copied
    run "cp #{release_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3.backup"
  end

  task :stop do
    run "cd #{current_path} && thin stop -e production"
  end

  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && thin start -e production -p 3999 -d"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && thin restart -e production"
  end
end
