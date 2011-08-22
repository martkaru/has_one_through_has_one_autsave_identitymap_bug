class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, :force => true do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :category_connections, :force => true do |t|
      t.references :from, :polymorphic => { :default => 'Category' }
      t.references :to, :polymorphic => { :default => 'Category' }
      t.timestamps
    end
  end
end