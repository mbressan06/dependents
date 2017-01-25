class AddUserToDependents < ActiveRecord::Migration
  def change
    add_reference :dependents, :user, index: true, foreign_key: true, on_delete: :nullify
  end
end
