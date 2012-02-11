require 'rbconfig'
gsub_file 'Gemfile', 'https://', 'http://'
append_file 'Gemfile' do
"
#{"gem 'therubyracer'" if RbConfig::CONFIG['target_os'] =~ /linux/i}
gem 'refinerycms', :path => '/code/parndt/Refinery'#:git => 'git://railscamp.github.com/parndt/refinerycms.git'

#  group :development, :test do
#    gem 'refinerycms-testing', '~> 2.0'
#  end

# USER DEFINED

# Add i18n support (optional, you can remove this if you really want to but it is advised to keep it).
gem 'refinerycms-i18n',   '~> 2.0.0', :path => '/code/refinerycms/refinerycms-i18n'#:git => 'git://railscamp.github.com/parndt/refinerycms-i18n.git'

# Specify additional Refinery CMS Engines here (all optional):
#  gem 'refinerycms-blog', :git => 'git://railscamp.github.com/parndt/refinerycms-blog.git', :branch => 'rails-3-1'
#  gem 'refinerycms-inquiries', :git => 'git://railscamp.github.com/parndt/refinerycms-inquiries.git', :branch => 'rails-3-1'
#  gem 'refinerycms-search', :git => 'git://railscamp.github.com/parndt/refinerycms-search.git', :branch => 'rails-3-1'
#  gem 'refinerycms-page-images', :git => 'git://railscamp.github.com/parndt/refinerycms-page-images.git', :branch => 'rails-3-1'

# END USER DEFINED
"
end

run 'bundle install'
rake 'db:create'
generate 'refinery:cms --fresh-installation'

rake 'railties:install:migrations db:migrate'

say <<-eos
  ============================================================================
    Your new RefineryCMS application is now running on edge and mounted to /.
  ============================================================================
eos
