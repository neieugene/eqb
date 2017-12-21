class LabQueue < ApplicationRecord
	has_many :tickets, dependent: :destroy
	has_many :clients, through: :tickets
  	validates :name, presence: true,
                    length: { minimum: 5 }
end
