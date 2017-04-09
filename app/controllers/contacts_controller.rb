class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thanks for contacting me! I\'ll do my best to get back to you soon.'
    else
      flash.now[:error] = 'Unable to send message. Try emailing me directly (see address in footer)'
      render :new
    end
  end
end
