class Link < ActiveRecord::Base
  belongs_to :user
  validates  :url, :url => true
  require 'pismo'

  enum read: [:unread, :read]

  def url_title
    return @url_title if defined? @url_title
    @url_title = begin
      page = Pismo::Document.new(url)
      page.title
    end
  end

end
