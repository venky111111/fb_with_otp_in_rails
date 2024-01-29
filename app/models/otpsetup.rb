class Otpsetup < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
