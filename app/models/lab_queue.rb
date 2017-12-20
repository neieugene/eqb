class LabQueue < ApplicationRecord
	has_many :tickets
	has_many :clients, through: :tickets
  	validates :name, presence: true,
                    length: { minimum: 5 }
end
