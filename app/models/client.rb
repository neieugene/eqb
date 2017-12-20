class Client < ApplicationRecord
	has_many :tickets
	has_many :lab_queues, through: :tickets
end
