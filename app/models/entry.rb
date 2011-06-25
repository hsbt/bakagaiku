# -*- coding: utf-8 -*-

class Entry < ActiveRecord::Base
  belongs_to :reception

  def text
    body =~ /<pre>(.*)<\/pre>/m ; $1
  end

  def title
    /^.{0,25}/m.match(text.gsub(/(<[^>]*>)|(\s+)/m, ''))
  end

  def pre_entry
    Entry.where(:id => self.id.to_i - 1).limit(1).first
  end

  def next_entry
    Entry.where(:id => self.id.to_i + 1).limit(1).first
  end

  def year
    parse_bakaid[1]
  end

  def month
    parse_bakaid[2]
  end

  def day
    parse_bakaid[3]
  end

  def number
    parse_bakaid[4]
  end

  private
  def parse_bakaid
    /^(\d\d\d\d)(\d\d)(\d\d)(\d*)/.match(bakaid).to_a
  end
end
