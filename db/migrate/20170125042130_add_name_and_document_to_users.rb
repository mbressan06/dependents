class AddNameAndDocumentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :document, :string
  end
end
