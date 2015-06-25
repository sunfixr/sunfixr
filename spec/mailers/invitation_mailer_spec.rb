require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do
  describe 'invite' do
    let(:user) { create(:user)}
    let(:project){ create(:project)}
    let(:mail){ InvitationMailer.invite({project_id: project.id, invitation: 'Hello World!', emails: 'r@r.com, b@b.com'},user)}

    it 'has the right subject' do
      expect(mail.subject).to eq "You are invited to the #{project.name} sunfixr project."
    end
    it 'has the correct to: email address' do
      expect(mail.to).to eq ["r@r.com", "b@b.com"]
    end

    it 'has the correct sender: email address' do
      expect(mail.from).to eq [user.email]
    end

    it 'has the invitation text in the body' do
      expect(mail.body.encoded).to match 'Hello World!'
    end

    it 'assigns a url' do
      expect(mail.body.encoded).to match /http\:\/\/localhost\:3000\/user\/sign_up\?project_id\=#{project.id.to_s}/
    end

  end
 end
