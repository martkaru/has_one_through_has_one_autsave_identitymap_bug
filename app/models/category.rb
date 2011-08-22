class Category < ActiveRecord::Base
  has_one :parent_connection, :as => :to, :class_name => 'CategoryConnection', :dependent => :destroy
  has_one :parent, :through => :parent_connection, :source_type => 'Category', :source => :from

  def self.test
    CategoryConnection.destroy_all

    parent = Category.find 1
    child = Category.find 2

    child.parent = parent
    child.save

    return parent.parent ? 'fail' : 'OK!'
  end
end
