class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :student
      t.references :room, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
