class Staff::SessionsController < Staff::Base
  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form= Staff::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = Staff::LoginForm.new(params[:staff_login_form])
    if staff_member = login_auth(@form)
      session[:staff_member_id] = staff_member.id
      redirect_to :staff_root
    else
      render action: 'new'
    end
  end

  def destroy
    session.delete(:staff_member_id)
    redirect_to :staff_root
  end

  private
  def login_auth(form_info)
    staff = StaffMember.find_by(email_for_index: form_info.email.try(:downcase))
    if Staff::Authenticator.new(staff).authenticate(form_info.password)
      staff
    end
  end
end
