require 'sync'

namespace :sync do

  desc "Process a page of articles"
  task :process => [:environment] do
    Sync::process_page
    # TODO mail if exception thrown
  end

end
