class Entry < ActiveRecord::Base
   belongs_to :reception
   def text
      body =~ /<pre>(.*)<\/pre>/m ; $1
   end

   def title
      /^.{0,25}/m.match(text.gsub(/(<[^>]*>)|(\s+)/m, ''))
   end

   attr_reader :year, :month, :day, :number
   def after_find
      a, @year, @month, @day, @number = /^(\d\d\d\d)(\d\d)(\d\d)(\d*)/.match(bakaid).to_a
   end
end
