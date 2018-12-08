class CreateShorters < ActiveRecord::Migration[5.2]
  def change
    create_table :shorters do |t|
      t.string :code
      t.text :original_url
      t.text :purified_url

      t.timestamps
    end
    add_index :shorters, :code, unique: true
  end
end
