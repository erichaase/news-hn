require 'sync'

namespace :sync do

  desc "Process Hacker News pages"
  task :process_hn => [:environment] do
    Sync::process_hn
    # TODO log/mail if exception thrown
  end

end
