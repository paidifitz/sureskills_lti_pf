class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.string   :name
      t.string   :client
      t.string   :audience
      t.text     :public_key
      t.text     :private_key
      t.text     :tool_public_key
      t.text     :jwt_url
      t.timestamps
    end
  end
end
