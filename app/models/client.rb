class Client < ApplicationRecord
	has_and_belongs_to_many :lab_queues
end