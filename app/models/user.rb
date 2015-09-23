class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email

  has_many :links

  def links_read_count
    @links_read_count ||= links.where("read = true").count
  end

  def links_read
    links.where("read = true")
  end

  def links_to_read_count
    @links_to_read_count ||= links.where("read = false").count
  end

  def links_to_read
    links.where("read = false")
  end
end
