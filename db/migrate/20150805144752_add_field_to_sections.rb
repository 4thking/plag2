class AddFieldToSections < ActiveRecord::Migration
  def change
    add_column :sections, :body, :text
  end
end
