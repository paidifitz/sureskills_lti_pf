class CreatePlatformKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :platform_keys do |t|
      t.string :name
      t.string :deployment_id
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
