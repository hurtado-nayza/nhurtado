class Contact < ApplicationRecord
	validates :name, :email, :phone, :message, presence: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Formato incorrecto" }
	validates :phone, format: {with: /\((\d{3})\)\s+(\d{3})-(\d{4})/}
end
