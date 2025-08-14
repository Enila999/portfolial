class ContactMailer < ApplicationMailer
  default to: "contact.portfolial@gmail.com"

  def contact_email(contact)
    @contact = contact
    mail(
      from: @contact,
      reply_to: "contact.portfolial@gmail.com",
      subject: "Nouveau message depuis le PortfoliAl"
    )
  end
end
