class EntryController < ApplicationController
   caches_page :index

   def index
      @entries = Entry.find :all, :order => "bakaid DESC", :limit => 5
   end

   def rss
      require 'rss/maker'
 
      @entries = Entry.find :all, :order => "bakaid DESC", :limit => 10
 
      rss = RSS::Maker.make("1.0") do |maker|
         @entries.each do |entry|
            item  = maker.items.new_item
            item.date            = Time.parse(entry.year + entry.month + entry.day)
            item.link            = url_for(:controller => 'entry', :action => 'view', :id => entry.bakaid)
            item.title           = entry.title.to_s
            item.description     = shorten(entry.text.to_s)
            item.content_encoded = "<pre>" + entry.text.to_s + "</pre>"
         end

         maker.channel.link  = url_for
         maker.channel.about = url_for
         maker.channel.title = "バカが征く on Rails"
         maker.channel.description = "バカが征く on Rails"
         maker.items.do_sort = true
         maker.items.max_size = 10
      end

      @headers["Content-Type"] = 'application/xml; charset=UTF-8'
      begin
         rss.output_encoding = "UTF-8"
      rescue RSS::UnknownConversionMethodError
      end
      
     self.class.cache_page render_to_string(:text => rss, :layout => false), '/entry/rss.xml'
     render :text => rss, :layout => false
   end
   
   def shorten(str, len = 120)
      lines = str.gsub(/<.+?>/, '').split(/\n/)
      lines[0].concat('...') if lines[0] and lines[1]
      lines[0]
   end
   def list
     @pages, @entries = paginate(:entry, :per_page => 30, :order_by => 'bakaid DESC')
     @begin_idx = @pages.items_per_page * @pages.current.previous.to_i
     @end_idx = @pages.current.next ? @pages.items_per_page * (@pages.current.next.to_i - 1) : 
               @entries.size + @pages.items_per_page * @pages.current.previous.to_i
   end

   def view
      @entry      = Entry.find(:first, :conditions => ['bakaid = ?', @params[:id]])
      @pre_entry  = Entry.find(:first, :conditions => ['id = ?', @entry.id.to_i - 1])
      @next_entry = Entry.find(:first, :conditions => ['id = ?', @entry.id.to_i + 1])
   end

   def mview
      @bakaid = @params[:id]
      @bakaid = '' if @bakaid.size < 6
      @entries = Entry.find_by_sql ['select * from entries where bakaid like ?', "#{@bakaid}%"]
   end
end
