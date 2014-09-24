class SaleImportsController < ApplicationController
  def new
    @sale_import = SaleImport.new
  end

  def create
    @sale_import = SaleImport.new(params[:sale_import])
    if @sale_import.save
      redirect_to root_url, notice: "Imported sales successfully."
    else
      render :new
    end
  end
end
