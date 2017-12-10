class StaticPagesController < ApplicationController
  
  
  def home
    @items = Item.where("promo_Price not null")
  end

  def help
  
  end

  def about

  end
  def homecategory
    st = params[:title]
    @items = Item.where("category like ? ", st)
  end


  def orderConfirmed
    
  end
  
  
  def paid
   
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    session[:cart] = nil
  end 
  
  def pcbuilder
    st = JSON.parse(params[:config])
    @config = st
    if st["CPU"]["id"] == "" 
      @items = Item.where("category like 'CPU'") 
    elsif st["Motherboard"]["id"] == "" 
      @items = Item.where("category like 'Motherboard' and socket_Type like ?", @config["CPU"]["socket_type"])
    elsif st["Memory"]["id"] == "" 
      @items = Item.where("category like 'Memory' and memory_Type like ?", @config["Motherboard"]["memory_type"])
    elsif st["GPU"]["id"] == "" 
      @items = Item.where("category like 'GPU'")
    elsif st["DVD-Bluray"]["id"] == "" 
      @items = Item.where("category like 'DVD-Bluray'")
    elsif st["Chassis"]["id"] == "" 
      @items = Item.where("category like 'Chassis'")
    elsif st["PSU"]["id"] == "" 
      @items = Item.where("category like 'PSU'")
    elsif st["Screen"]["id"] == "" 
      @items = Item.where("category like 'Screen'")      
    elsif st["HDD"]["id"] == "" 
      @items = Item.where("category like 'HDD'") 
    elsif st["SSD"]["id"] == "" 
      @items = Item.where("category like 'SSD'") 
    else
      st = JSON.dump(@st)
      redirect_to :controller => 'cart', :action => 'build'
    end
  end
end
