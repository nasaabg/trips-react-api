class Trip < ApplicationRecord
  alias_attribute :owners, :users

  has_and_belongs_to_many :users
end
