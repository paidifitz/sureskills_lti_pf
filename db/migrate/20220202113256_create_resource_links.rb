class CreateResourceLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :resource_links do |t|
      t.string :title
      t.string :description
      t.string :tool_link_url
      t.string :login_url
      t.string :role
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
