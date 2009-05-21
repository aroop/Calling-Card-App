class PinlessNumbersController < ApplicationController
  
  layout "account"
  
  before_filter :require_user
  
  def new
    @pinless_numbers = current_user.pinless_numbers
    @pinless_numbers << PinlessNumber.new

    respond_to do |format|
      flash[:notice] = 'Please update the newly created pinless dial entry.'
      format.html{ redirect_to :action => "index" }
      format.xml  { render :xml => @pinless_numbers }
    end
  end
  
  def create
    @pinless_number = current_user.pinless_numbers.new(params[:pinless_number])

    respond_to do |format|
      if @pinless_number.save
        flash[:notice] = 'Pinless dial number was successfully created.'
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @pinless_number, :status => :created, :location => @pinless_number }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pinless_number.errors, :status => :unprocessable_entity }
      end
    end
  end
	
	def index
		@pinless_numbers = current_user.pinless_numbers
		if (current_user.pinless_numbers.size == 0)
		  @pinless_numbers << current_user.pinless_numbers.new
	  end
	  
	  respond_to do |format|
      format.html
      format.xml  { render :xml => @pinless_numbers }
    end
	end
	
	def update
	  unless (params[:commit] == 'Delete')
	    @pinless_number = PinlessNumber.find(params[:id])

      respond_to do |format|
        if @pinless_number.update_attributes(params[:pinless_number])
          flash[:notice] = 'Pinless dial number was successfully updated.'
          format.html { redirect_to  :action => "index" }
          format.xml  { head :ok }
        else
          format.html { render :action => "index" }
          format.xml  { render :xml => @pinless_number.errors, :status => :unprocessable_entity }
        end
      end
    else
      #Delete 
      @pinless_number = PinlessNumber.find(params[:id])
      @pinless_number.destroy
      
      flash[:notice] = 'Pinless dial number was successfully deleted.'
      respond_to do |format|
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      end
    end
	end
	
end
