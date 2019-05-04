class AddColumnToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :family_name, :string
    add_column :companies, :first_name, :string
    add_column :companies, :family_name_kana, :string
    add_column :companies, :first_name_kana, :string
  end
end
