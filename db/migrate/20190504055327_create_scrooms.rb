class CreateScrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :scrooms do |t|
      t.references :student, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
