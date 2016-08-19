class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.integer :question_id
    	t.integer :user_id
    	t.text :answer_body
    	t.timestamps
    end
  end
end
