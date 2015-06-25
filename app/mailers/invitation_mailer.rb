class InvitationMailer < ApplicationMailer
  default from: 'admin@sunfixr.com'

  def invite(params, user)
    @invitation = params[:invitation]
    @project = Project.find(params[:project_id].to_i)
    @user = user
    @url = "http://#{default_url_options[:host]}:#{default_url_options[:port]}/user/sign_up?project_id=#{@project.id.to_s}"
    mail(from: user.email, to: params[:emails], subject: "You are invited to the #{@project.name} sunfixr project.")
  end
end
