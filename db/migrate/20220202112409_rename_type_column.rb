class RenameTypeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :contexts, :type, :context_type
  end
end
