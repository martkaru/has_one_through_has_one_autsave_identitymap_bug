class CategoryConnection < ActiveRecord::Base
  belongs_to :from, :polymorphic => true
  belongs_to :to, :polymorphic => true
end