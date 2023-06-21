class UsertoaddColum < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :string
    add_column :users, :persno_information, :string
  end
end
