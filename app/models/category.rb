class Category < ActiveRecord::Base
  has_one :parent_connection, :as => :to, :class_name => 'CategoryConnection', :dependent => :destroy
  has_one :p, :through => :parent_connection, :source_type => 'Category', :source => :from

  def self.test
    CategoryConnection.destroy_all

    p = Category.find 1
    c = Category.find 2

    c.p = p
    c.save

    return p.p ? 'fail' : 'OK!'
  end
end
