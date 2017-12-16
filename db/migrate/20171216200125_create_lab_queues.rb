class CreateLabQueues < ActiveRecord::Migration[5.1]
  def change
    create_table :lab_queues do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
