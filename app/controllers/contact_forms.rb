class ContactFormsController < ApplicationController
  
  def new
    @contact_form = ContactForm.new
  end
  
  
  def create
    @contact_form = ContactForm.new(contact_form_params)
    
    if @contact_form.save
      redirect_to root_path, notice: 'Formulário enviado.'
    else
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:id_product, :problem_description, :buyer_phone)
  end
end