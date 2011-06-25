# -*- coding: utf-8 -*-

class EntryController < ApplicationController
	def index
		@entries = Entry.order("bakaid DESC").limit(5)
	end

	def list
		@entries = Entry.order("bakaid DESC").page(params[:page])
	end

	def show
		@entry = Entry.where(:bakaid => params[:id]).limit(1).first
		@pre_entry	= @entry.pre_entry
		@next_entry = @entry.next_entry
	end

	def mview
		@bakaid = params[:id]
		@bakaid = '' if @bakaid.size < 6
		@entries = Entry.find_by_sql ['select * from entries where bakaid like ?', "#{@bakaid}%"]
	end

	def feed
    @entries = Entry.order("bakaid DESC").limit(5)

    respond_to do |format|
      format.rss { render :layout => nil }
    end
  end

  private

	def shorten(str, len = 120)
		lines = str.gsub(/<.+?>/, '').split(/\n/)
		lines[0].concat('...') if lines[0] and lines[1]
		lines[0]
	end
end
