class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def alphabetized
     @customers = Customer.order("LOWER(full_name) ASC")
  end

  def missing_email
    @customers = Customer.where(email: [nil, ""])
  end
end
