class AddAttachmentImageToDependents < ActiveRecord::Migration
  def self.up
    change_table :dependents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :dependents, :image
  end
end
