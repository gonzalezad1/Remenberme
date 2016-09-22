class AddFieldToComment < ActiveRecord::Migration
  def change
    add_column :comments, :question_id, :integer
    
  end
end
