class UsetToAddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account,:string

  end
end
