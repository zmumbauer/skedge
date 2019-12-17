class MemberMailer < ApplicationMailer

  def invitation(invitation)
    @email = invitation.email
    @organization = Organization.find(invitation.organization_id)
    @invite_url = new_user_registration_url(invite_token: invitation.token, email: @email)
    mail(to: @email, subject: "You have been invited to join #{@organization.name}")
  end

  def swap_approved(swap_request)
    @user = User.find(swap_request.requesting_user_id)
    @shift = Timeperiod.find(swap_request.timeperiod_id)
    @fulfilling_user = User.find(swap_request.fulfilling_user_id)
    @requesting_user = User.find(swap_request.requesting_user_id)

    mail(to: @requesting_user.email, subject: "You are no longer working #{@shift.start_time.strftime("%b %e")+ " " + "#{Timeperiod.find(swap_request.timeperiod_id).start_time.strftime("%l:%M%P")}" + " to " + "#{Timeperiod.find(swap_request.timeperiod_id).end_time.strftime("%l:%M%P")}"}")
  end
end
