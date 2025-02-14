class DeliveriesController < ApplicationController
  def index
    matching_deliveries = Delivery.all

    @list_of_deliveries = matching_deliveries.order({ :created_at => :desc })

    render({ :template => "deliveries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_deliveries = Delivery.where({ :id => the_id })

    @the_delivery = matching_deliveries.at(0)

    render({ :template => "deliveries/show" })
  end

  def create
    the_delivery = Delivery.new
    the_delivery.recipient_id = current_user.id
    the_delivery.description = params.fetch("query_description")
    the_delivery.arrival_date = params.fetch("query_arrival_date")
    the_delivery.details = params.fetch("query_details")
    the_delivery.delivery_status = params.fetch("query_delivery_status", false)

    if the_delivery.valid?
      the_delivery.save
      redirect_to("/", { :notice => "Added to list" })
    else
      redirect_to("/", { :alert => the_delivery.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    # the_delivery.recipient_id = params.fetch("query_recipient_id")
    # the_delivery.description = params.fetch("query_description")
    # the_delivery.arrival_date = params.fetch("query_arrival_date")
    # the_delivery.details = params.fetch("query_details")
    the_delivery.delivery_status = true

    # if the_delivery.valid?
      the_delivery.save
    #   redirect_to("/deliveries/#{the_delivery.id}", { :notice => "Delivery updated successfully."} )
    # else
    #   redirect_to("/deliveries/#{the_delivery.id}", { :alert => the_delivery.errors.full_messages.to_sentence })
    # end

    redirect_to("/")
  end

  def destroy
    the_id = params.fetch("path_id")
    the_delivery = Delivery.where({ :id => the_id }).at(0)

    the_delivery.destroy

    redirect_to("/deliveries", { :notice => "Delivery deleted successfully."} )
  end
end
