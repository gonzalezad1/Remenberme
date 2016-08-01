class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer :user_id
    	t.text :question_title
    end
  end
end
