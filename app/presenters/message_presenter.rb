class MessagePresenter < BasePresenter
  presents :message

  # def option_links
  #   if order_payment.order.completed? || order_payment.payment_type_id == PaymentType.get_credit_card_id || order_payment.payment_type_id == PaymentType.get_promotion_id
  #     ""
  #   else
  #     render "option_links", order_payment: order_payment
  #   end
  # end

  def edit_link
    if (message.user_id == current_user.id) || current_user.is_admin?
      link_to 'Edit', edit_message_path(message)
    end
  end

  def destroy_link
    if current_user.is_admin?
      link_to 'Destroy', message, :method => :delete, :data => { :confirm => 'Are you sure?' }
    end
  end

end