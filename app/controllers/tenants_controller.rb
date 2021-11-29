class TenantsController < ApplicationController


  def index
    tenants = Tenant.all 
    render json: tenants
  end

  def show 
    tenant = Tenant.find(params[:id])
    if tenant.valid?
      render json: tenant
    else
      render json: {error: tenant.errors.full_messages}, status: :not_found
    end
  end

  def create
    tenant = Tenant.create(tenant_params)
    if tenant.valid?
      render json: tenant, status: :created
    else 
      render json: {error: tenant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    tenant = Tenant.find(params[:id])
    if tenant.valid?
      tenant.destroy
      head :no_content
    else
      render json: {error: "Tenant not Found"}, status: :not_found
    end
  end


  private

  def tenant_params
    params.permit(:name, :age)
  end


end
