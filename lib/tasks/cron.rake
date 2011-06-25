def baka_reader(n = nil)
  last_reception = Reception.find(:first, :order => "id DESC")
  @reception = Reception.create
  @reception.extend BakaReception
  @reception.wget_new_entries(n)
  if last_reception
    @reception.destroy if 0 == @reception.entries.count
    last_reception.extend BakaReception
    last_reception.reload_last_entry
  end
end

def srcdir
  File.dirname(File.expand_path(__FILE__)).untaint
end

$LOAD_PATH.unshift srcdir
require 'myutil'
require 'nkf'
setup_environment

n = ARGV[0].to_i
n = 20 if n <= 0

ActiveRecord::Base.transaction do
  baka_reader n
end
