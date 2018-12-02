class MasterProductType < ApplicationRecord
	has_many :products, dependent: :destroy
end
