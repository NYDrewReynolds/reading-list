class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email

  has_many :links

  def links_read
    links.where("read = true").count
  end
end
