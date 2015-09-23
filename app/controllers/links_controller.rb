class LinksController < ApplicationController
  require 'byebug'

  def index
  end

  def new
  end

  def create
    link_url = params[:url]
    new_link = Link.new(url: link_url, user_id: current_user.id)
    if new_link.save
      respond_to do |format|
        format.js { render json: {success: true} }
        format.json { render json: {success: true, url: new_link.url, url_title: new_link.url_title, link_id: new_link.id} }
      end
    else
      flash.now[:error] = "Please be sure to include a valid URL."
    end
  end

  def update
    link_id = params[:link_id]
    link = Link.find(link_id)
    if link.unread?
      link.update!(read: 1)
    else
      link.update!(read: 0)
    end
    link
    respond_to do |format|
      format.js { render json: {success: true} }
      format.json { render json: {success: true, url: link.url, url_title: link.url_title, link_id: link.id} }
    end
  end

end
