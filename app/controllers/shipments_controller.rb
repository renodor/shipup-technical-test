# frozen_string_literal:true

class ShipmentsController < ApplicationController
  def index
    return render json: { errors: ['company_id is required'] }, status: :unprocessable_entity if params[:company_id].blank?

    shipments = Shipment.where(company_id: params[:company_id]).take(20)

    products = shipments.map do |shipment|
      product_ids = ShipmentProduct.where(shipment_id: shipment.id).pluck(:product_id)
      Product.where(id: product_ids)
    end

    render json: {}
  end
end

# sort_direction=asc
# sort_attribute=company_id

# page=2
# number_of_record_per_page=10