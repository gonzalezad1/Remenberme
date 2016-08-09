class AddMissingTimestamps < ActiveRecord::Migration
  def change
    add_timestamps :questions
    add_timestamps :answers
    add_timestamps :comments
  end
end