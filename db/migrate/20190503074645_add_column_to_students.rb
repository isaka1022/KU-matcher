class AddColumnToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :family_name, :string
    add_column :students, :first_name, :string
    add_column :students, :family_name_kana, :string
    add_column :students, :first_name_kana, :string
  end
end
