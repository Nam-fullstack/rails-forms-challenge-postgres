class Profile < ApplicationRecord
    has_many :addresses, dependent: :destroy
    accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank
end
