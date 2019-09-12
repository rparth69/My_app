require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def setup
   @customer = Customer.new(first_name: "abc", last_name: "abc", phone_number: "1234567891")
 end



  test "name should be present" do
    @customer.first_name = ""
    assert_not @customer.valid?
  end

  test "phone  Number should be present" do
    @customer.phone_number = "     "
    assert_not @customer.valid?
  end
end
