desc 'cron job'
task :cron => :environment do
  Reception.fetch_bakagaiku!
end
