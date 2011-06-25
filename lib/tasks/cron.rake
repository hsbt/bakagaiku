desc 'fetch latest bakagaiku'
task :fetch_bakagaiku do
  Reception.fetch_bakagaiku!
end
