class RecreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.references :cocktail, foreign_key: true, null: false
      t.references :ingredient, foreign_key: true, null: false
      t.timestamps
    end
  end
end
