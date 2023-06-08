class UsertoRenameColum < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :persno_information, :personal_information
  end
end
