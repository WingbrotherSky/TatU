class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :art

      t.timestamps
    end
  end
end
