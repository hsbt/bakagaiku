# -*- coding: utf-8 -*-

class Entry < ActiveRecord::Base
  belongs_to :reception

  default_scope { order('bakaid DESC') }

  attr_reader :year, :month, :day, :number
  after_find :parse_bakaid

  def text
    body =~ /<pre>(.*)<\/pre>/m ? $1 : ""
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

  private
  def parse_bakaid
    dummy, @year, @month, @day, @number = /^(\d\d\d\d)(\d\d)(\d\d)(\d*)/.match(bakaid).to_a
  end
end
