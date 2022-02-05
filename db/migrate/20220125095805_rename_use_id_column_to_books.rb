class RenameUseIdColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :use_id, :user_id
  end
end
