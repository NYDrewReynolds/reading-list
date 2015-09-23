class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :first_name
  validates_uniqueness_of :email, :password_digest

  has_many :links

  def links_read_count
    @links_read_count ||= links.read.count
  end

  def links_read
    links.read
  end

  def links_to_read_count
    @links_to_read_count ||= links.unread.count
  end

  def links_to_read
    links.unread
  end
end
