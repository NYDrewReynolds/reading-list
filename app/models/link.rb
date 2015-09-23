class Link < ActiveRecord::Base
  belongs_to :user
  require 'pismo'

  def url_title
    page = Pismo::Document.new(url)
    page.title
  end
end
