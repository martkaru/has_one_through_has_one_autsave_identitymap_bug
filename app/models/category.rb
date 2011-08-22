class Category < ActiveRecord::Base
  has_one :parent_connection, :as => :to, :class_name => 'CategoryConnection', :dependent => :destroy
  has_one :parent, :through => :parent_connection, :source_type => 'Category', :source => :from

  def self.test
    CategoryConnection.destroy_all
    Category.destroy_all

    parent = Category.create(:name => 'Parent')
    child = Category.create(:name => 'Child')

    child.parent = parent
    child.save

    return parent.parent ? 'fail' : 'OK!'
  end
end
