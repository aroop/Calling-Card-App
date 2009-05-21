# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Outputs the corresponding flash message if any are set
  def flash_messages
    messages = []
    messages << content_tag(:div, nil, :class => "break", :style => "height: 10px")
    %w(notice warning error).each do |msg|
      messages << content_tag(:div, html_escape(flash[msg.to_sym]), :class => "flash-#{msg}") unless flash[msg.to_sym].blank?
    end
    messages
  end
  
  def discount_label(discount)
    (discount.percent? ? number_to_percentage(discount.amount * 100, :precision => 0) : number_to_currency(discount.amount)) + ' off'
  end

  def controller_is(*attrs) # <= check for one or multiple controllers
    attrs.collect{|attr| attr.to_s}.include?(controller.controller_name)
  end

  def action_is(*attrs) # <= check for  one or multiple actions
    attrs.map{|attr| attr.to_s}.include?(controller.action_name)
  end

  def controller_action_is(c,a) # <= check for controller and action
    controller_is(c) && action_is(a)
  end
  
end
