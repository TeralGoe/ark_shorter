class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :ip
      t.string :country
      t.references :shorter, foreign_key: true

      t.timestamps
    end
  end
end
