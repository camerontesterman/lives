class Language < ApplicationRecord
  has_and_belongs_to_many :countries
  has_many :firstnames
  has_many :surnames
end
