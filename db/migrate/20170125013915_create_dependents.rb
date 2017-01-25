class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.string :name
      t.string :kinship_type

      t.timestamps null: false
    end
  end
end
