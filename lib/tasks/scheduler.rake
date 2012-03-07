namespace :scheduler do
  desc 'update_feed'
  task :update_feed => :environment do
    Reception.fetch_bakagaiku!
  end
end
