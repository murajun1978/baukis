class StaffMember < ActiveRecord::Base
  before_validation do
    salf.email_for_index = email.downcase if email
  end
end
