class CreateArts < ActiveRecord::Migration[5.1]
  def change
    create_table :arts do |t|
      t.string :url
      t.references :artist, foreign_key: true
      t.boolean :primary

      t.timestamps
    end
  end
end
