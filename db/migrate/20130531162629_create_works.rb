class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
    	t.string :user_id
      t.string :work_time

      t.timestamps
    end
  end
end
