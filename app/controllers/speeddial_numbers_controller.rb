class SpeeddialNumbersController < ApplicationController

  layout "account"
  
  before_filter :require_user
  
  def new
    @speeddial_numbers = current_user.speeddial_numbers
    @speeddial_numbers << SpeeddialNumber.new

    respond_to do |format|
      flash[:notice] = 'Please update the newly created speeddial entry.'
      format.html{ redirect_to :action => "index" }
      format.xml  { render :xml => @speeddial_numbers }
    end    
  end
  
  def create
    @speeddial_number = current_user.speeddial_numbers.new(params[:speeddial_number])

    respond_to do |format|
      if @speeddial_number.save
        flash[:notice] = 'Speeddial number was successfully created.'
        format.html { redirect_to user_speeddial_numbers_path(current_user) }
        format.xml  { render :xml => @speeddial_number, :status => :created, :location => @speeddial_number }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @speeddial_number.errors, :status => :unprocessable_entity }
      end
    end    
  end
  
	def index
	  @speeddial_numbers = current_user.speeddial_numbers
		if (current_user.speeddial_numbers.size == 0)
		  @speeddial_numbers << current_user.speeddial_numbers.new
	  end
	  
	  respond_to do |format|
      format.html
      format.xml  { render :xml => @speeddial_numbers }
    end
	end
	
	def update
	  unless (params[:commit] == 'Delete')
	    @speeddial_number = SpeeddialNumber.find(params[:id])

      respond_to do |format|
        if @speeddial_number.update_attributes(params[:speeddial_number])
          flash[:notice] = 'Speeddial number was successfully updated.'
          format.html { redirect_to  :action => "index" }
          format.xml  { head :ok }
        else
          format.html { render :action => "index" }
          format.xml  { render :xml => @speeddial_number.errors, :status => :unprocessable_entity }
        end
      end
    else
      #Delete 
      @speeddial_number = SpeeddialNumber.find(params[:id])
      @speeddial_number.destroy
      
      flash[:notice] = 'Speeddial number was successfully deleted.'
      respond_to do |format|
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      end
    end
	end

end