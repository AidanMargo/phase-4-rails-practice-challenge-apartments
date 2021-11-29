class LeasesController < ApplicationController

  def index
    leases = Lease.all 
    render json: leases
  end

  def create
    lease = Lease.create(lease_params)
    if lease.valid?
      render json: lease, status: :created
    else
      render json: {error: lease.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
      lease = Lease.find(params[:id])
      if lease.valid?
        lease.destroy
        head :no_content
      else
        render json: {error: "Lease not Found"}, status: :not_found
    end
  end

  private 

  def lease_params
    params.permit(:rent, :apartment_id, :tenant_id)
  end

end
