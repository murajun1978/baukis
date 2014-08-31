require 'rails_helper'

describe Staff::Authenticator do
  describe '#authenticate' do
    let(:staff_member) { build(:staff_member) }
    example '正しいパスワードならtrueを返す' do
      expect(Staff::Authenticator.new(staff_member).authenticate('pw')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      expect(Staff::Authenticator.new(staff_member).authenticate('xy')).to be_falsy
    end

    example 'パスワード未設定ならfalseを返す' do
      staff_member.password = nil
      expect(Staff::Authenticator.new(staff_member).authenticate(nil)).to be_falsy
    end

    example '停止フラグが立っていればfalseを返す' do
      staff_member.suspended = true
      expect(Staff::Authenticator.new(staff_member).authenticate('pw')).to be_falsy
    end

    example '開始前ならfalseを返す' do
      staff_member.start_date = Date.tomorrow
      expect(Staff::Authenticator.new(staff_member).authenticate('pw')).to be_falsy
    end

    example '終了後ならfalseを返す' do
      staff_member.end_date = Date.today
      expect(Staff::Authenticator.new(staff_member).authenticate('pw')).to be_falsy
    end
  end
end
