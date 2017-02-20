class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :answerA
      t.string :answerB
      t.attachment :photoA
      t.attachment :photoB
    end
  end
end
