class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :load_defaults, :only => [:new, :create]
  
  layout "account"
  
  def new
    render :layout => "application"
  end
  
  def create
    @user.first_name = @creditcard.first_name
    @user.last_name = @creditcard.last_name
    @user.creditcard = @creditcard
    @user.plan = @plan
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => 'new',  :layout => "application"
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => 'edit'
    end
  end
  
  def show
    @user = current_user

    respond_to do |format|
			format.html
    	format.xml  { render :xml => @user }
    end
  end
  
  protected
  
  def load_defaults
    @user = User.new(params[:user])
    @creditcard = ActiveMerchant::Billing::CreditCard.new(params[:creditcard])
    @plan = params[:plan]? Plan.find(params[:plan]) : Plan.find_by_name('Plus')    
  end
  
end
