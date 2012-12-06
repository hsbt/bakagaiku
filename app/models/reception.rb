class Reception < ActiveRecord::Base
  has_many :entries
  default_scope order: 'id DESC'

  class << self
    def fetch_bakagaiku!(max = Settings.max_fetch_entries)
      reception = create!
      reception.wget_new_entries(max)
      reception.destroy if reception.entries.count.zero?
    end
  end

  def wget_new_entries(max)
    if last_entry = Entry.limit(1).first
      last_entry.bakaid =~ /^(\d\d\d\d)(\d\d)(\d\d)/
      first_year, first_month, first_day = $1.to_i, $2.to_i, $3.to_i
    else
      first_year, first_month, first_day = Settings.beginning_date
    end
    t = Time.now
    last_year, last_month, last_day = t.year, t.mon, t.day

    counter = 0
    (first_year..last_year).each do |y|
      (1..12).each do |m|
        next if y == first_year && m < first_month
        break if y == last_year && m > last_month
        (1..31).each do |d|
          next if y == first_year && m == first_month && d < first_day
          break if y == last_year && m == last_month && d > last_day
          (0..100).each do |n|
            return 0 if counter >= max
            bakaid = sprintf "%04d%02d%02d", y, m, d
            bakaid += n.to_s if n > 0
            next if Entry.where(:bakaid => bakaid).limit(1).first
            counter += 1
            break unless create_or_update_entry(bakaid)
          end
        end
      end
    end
  end

  private

  def wget_entry(bakaid)
    require 'net/http'
    Net::HTTP.version_1_2
    Net::HTTP.start(Settings.baka.address, Settings.baka.port) do |http|
      http.request_get( Settings.baka.path + bakaid )
    end
  end

  def create_or_update_entry(bakaid)
    response = wget_entry(bakaid)
    return nil unless response.code == "200"

    if entry = Entry.where(bakaid: bakaid).first
      entry.update_attibutes!(body: response.body)
    else
      entry = entries.create!(bakaid: bakaid, body: response.body)
    end
    entry
  end
end
