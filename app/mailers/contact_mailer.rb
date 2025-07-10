class ContactMailer < ApplicationMailer
  default to: "contact.portfolial@gmail.com"

  def contact_email(contact)
    @contact = contact
    mail(
      from: "contact.portfolial@gmail.com",
      reply_to: @contact.email,
      subject: "Nouveau message depuis le PortfoliAl"
    )
  end
end
