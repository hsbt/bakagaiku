# -*- coding: utf-8 -*-

class EntryController < ApplicationController
  def index
    @entries = Entry.limit(5)
  end

  def list
    @entries = Entry.page(params[:page])
  end

  def show
    @entry = Entry.where(:bakaid => params[:id]).limit(1).first
  end

  def mview
    @bakaid = params[:id].size < 6 ? '' : params[:id]
    @entries = Entry.where('bakaid like ?', "#{@bakaid}%")
  end

  def feed
    @entries = Entry.limit(5)

    respond_to do |format|
      format.rss { render :layout => nil }
    end
  end
end
