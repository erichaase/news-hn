require 'sync'

namespace :sync do

  desc "Processes Hacker News pages"
  task :hn => [:environment] do
    Sync::hn
    # TODO log/mail if exception thrown
  end

end
