class AddCountToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :count, :integer, default: 0
  end
end
