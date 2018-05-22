class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :avatar_url
      t.references :shop, foreign_key: true
      t.integer :years_of_experience
      t.string :weibo_url

      t.timestamps
    end
  end
end
