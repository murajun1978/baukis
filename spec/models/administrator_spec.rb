require 'rails_helper'

RSpec.describe Administrator, :type => :model do
  describe '#password=' do
    let(:admin) { Administrator.new }

    context '文字列を指定した場合' do
      before { admin.password = 'baukits' }
      it 'hashed_passwordは文字列' do
        expect(admin.hashed_password).to be_kind_of(String)
      end

      it 'hashed_passwordは長さ60' do
        expect(admin.hashed_password.size).to eq 60
      end
    end

    context 'nilを指定した場合' do
      before { admin.password = nil }

      it 'hashed_passwordはnil' do
        expect(admin.hashed_password).to be_nil
      end
    end
  end
end
