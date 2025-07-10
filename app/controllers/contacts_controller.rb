class ContactsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: "Merci pour votre message !"
    else
      flash.now[:alert] = "Merci de remplir tous les champs."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
