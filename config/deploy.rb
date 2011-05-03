set :application, "testopdracht"
set :repository,  "https://jeroeningen@github.com/jeroeningen/testopdracht.git"

set :scm, :git
set :deploy_to, "/rails"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db, "localhost", :primary => true

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
   end
 end
after 'deploy:update_code', 'deploy:symlink_shared', "deploy:migrate"