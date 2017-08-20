class Product < ApplicationRecord
	has_many :vendor_products
	has_many :vendors, through: :vendor_products
	has_many :user_vendor_products, through: :vendor_products
	has_many :users, through: :vendor_products

end
