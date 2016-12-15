class AlterTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :prep_list, :prep_lists
  end
end
