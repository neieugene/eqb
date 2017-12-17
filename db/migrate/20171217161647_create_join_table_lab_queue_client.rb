class CreateJoinTableLabQueueClient < ActiveRecord::Migration[5.1]
  def change
    create_join_table :lab_queues, :clients do |t|
      # t.index [:lab_queue_id, :client_id]
      # t.index [:client_id, :lab_queue_id]
    end
  end
end
