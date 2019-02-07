class ContactsController < ApplicationController
	before_action :set_contact, only: [:show] #importante agregar
    before_action :authenticate_user!, only: [:index, :show]

    def index
    	@contacts = Contact.all
    end

    def show
    end

    def new
    	@contact = Contact.new
    end

    def create
    	@contact = Contact.new(contact_params)

	    respond_to do |format|
	      if @contact.valid?
	        if @contact.save
	          format.html { redirect_to root_path, notice: 'Enviado' }
	          #format.json { render :show, status: :created, location: @contact }
	        else
	          format.html { render :new }
	          format.json { render json: @contact.errors, status: :unprocessable_entity }
	        end
	      else
	        format.html { render :new }
	        format.json { render json: @contact.errors, status: :unprocessable_entity }
	      end
	    end
	  end
    private

	  def set_contact
	    @contact = Contact.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def contact_params
	    params.require(:contact).permit(:name, :email, :phone, :message)
	  end
end
