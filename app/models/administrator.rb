class Administrator < ActiveRecord::Base
  before_validation do
    self.email_for_index = email.downcase if email
  end

  def password=(row_password)
    if row_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(row_password)
    else
      self.hashed_password = nil
    end
  end
end
