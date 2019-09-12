# frozen_string_literal: true

# UserCity
class UserCity < ApplicationRecord
  belongs_to :city
  belongs_to :user
end
