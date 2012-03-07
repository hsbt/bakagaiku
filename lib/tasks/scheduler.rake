namespace :scheduler do
  desc 'update_feed'
  task :update_feed => [:environment] do
    # XXX
    require 'reception'
    require 'entry'
    require 'settings'

    Reception.fetch_bakagaiku!
  end
end
