class SaleImportsController < ApplicationController
  def new
    @sale_import = SaleImport.new
  end

  def create
    log_file = LogFile.create(creator: current_user, updater: current_user)
    @sale_import = SaleImport.new(params[:sale_import])
    if @sale_import.save(current_user, log_file)
      redirect_to root_url, notice: "Imported sales successfully."
    else
      render :new
    end
  end
end
