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
        format.json { render json: {success: true, url: new_link.url, url_title: new_link.url_title} }
      end
    else
      render 'links/index'
      flash[:error] = "Please be sure to include a valid URL."
    end
  end

end
