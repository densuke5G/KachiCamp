class Public::ContactsController < ApplicationController
before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    @contact.name = params[:contact][:name]
    @contact.content = params[:contact][:content]
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_mail(@contact, current_user).deliver
      redirect_to thanks_contacts_path, notice: 'お問い合わせ・ご意見を送信しました'
    else
      render :new
    end
  end

  def thanks
  end


  private


    def contact_params
      params.require(:contact).permit(:name, :content)
    end
end
