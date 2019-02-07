class Contact < ApplicationRecord
	validates :name, :email, :phone, :message, presence: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Formato incorrecto" }
	validates :phone, format: {with: /\+(\d{1,3})\s+(\d{3})\s+(\d{7})/, message: "Ej: +58 414 8076973"}
end
