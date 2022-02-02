class CreateContexts < ActiveRecord::Migration[6.1]
  def change
    create_table :contexts do |t|
      t.string :label
      t.string :title
      t.string :type
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
