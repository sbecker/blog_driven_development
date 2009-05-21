# template.rb
run "rm public/index.html"
# generate(:scaffold, "person name:string")
# route "map.root :controller => 'people'"
# rake("db:migrate")

gem "authlogic"
gem "chriseppstein-compass", :lib => 'compass'
gem "cucumber"
gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
gem "rspec", :lib => false
gem "rspec-rails", :lib => false
gem "thoughtbot-shoulda", :lib => 'shoulda'
gem "webrat"

rake "gems:install"

run "haml --rails ."
run "yes | compass --rails -f blueprint ."

generate :rspec
generate :cucumber

git :init

# Set up .gitignore files
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run %{find . -type d -empty | grep -v "vendor" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}
file '.gitignore', <<-END
.rake-completion
.DS_Store
config/database.yml
coverage
db/*.sqlite3
*.tmproj
log/*.log
tmp/*
tmp/**/*
tmp/restart.txt
public/system
END

git :add => "."
git :commit => "-a -m 'Initial commit'"
