class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
