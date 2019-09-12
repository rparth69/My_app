# frozen_string_literal: true

# user helper
module UsersHelper
  def user_fname(cleaner_id)
    User.find(cleaner_id).first_name
  end

  def user_lname(cleaner_id)
    User.find(cleaner_id).last_name
  end
end
