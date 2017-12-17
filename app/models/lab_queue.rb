class LabQueue < ApplicationRecord
	has_and_belongs_to_many :clients
  	validates :name, presence: true,
                    length: { minimum: 5 }
end
