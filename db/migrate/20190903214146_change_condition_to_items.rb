class ChangeConditionToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :condition, :integer
  end
end
