class AddColumnTofllower < ActiveRecord::Migration[7.0]
  def change
    add_column  :followability_relationships, :active_status,:boolean
  end
end
