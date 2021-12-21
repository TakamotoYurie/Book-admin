class AddStatusToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :sales_status, :intger
  end
end
