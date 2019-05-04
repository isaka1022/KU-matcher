class CreateScmessages < ActiveRecord::Migration[5.2]
  def change
    create_table :scmssages do |t|
      t.references :scroom
      t.boolean :is_student
      t.text :content

      t.timestamps
    end
  end
end
