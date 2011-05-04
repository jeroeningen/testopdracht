
set :application, "testopdracht"
set :repository,  "https://jeroeningen@github.com/jeroeningen/testopdracht.git"

set :scm, :git
set :deploy_to, "/rails/testopdracht"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost", "192.168.168.129"
role :app, "localhost", "192.168.168.129"
role :db, "localhost", "192.168.168.129", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  task :bundle_install do
    run "export PATH=$PATH:/var/lib/gems/1.8/bin/ && cd #{release_path} && bundle install --deployment --without test"
  end
end

after 'deploy:update_code', "deploy:bundle_install", 'deploy:symlink_shared', "deploy:migrate"