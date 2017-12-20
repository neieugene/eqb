class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :client, foreign_key: true
      t.references :lab_queue, foreign_key: true
      t.timestamp :time

      t.timestamps
    end
  end
end
