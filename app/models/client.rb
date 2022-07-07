class Client < ApplicationRecord
  has_many :projects
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
end
