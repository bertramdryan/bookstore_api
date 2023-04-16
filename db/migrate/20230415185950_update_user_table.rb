class UpdateUserTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :id, :uuid
  end
end
