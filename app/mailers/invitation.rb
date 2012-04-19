class Invitation < ActionMailer::Base
  default :from => "bzhu01@syr.edu"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation.invitefriend.subject
  #
  def invitefriend(user, invitee, event)
    @greeting = "Hi"
    @user = user
    @invitee = invitee
    @event = event
    mail :to => "bzhu01@syr.edu" # in reality, you will make this invitee.email or something
  end
end
