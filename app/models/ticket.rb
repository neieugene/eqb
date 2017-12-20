class Ticket < ApplicationRecord
  belongs_to :client
  belongs_to :lab_queue
end
