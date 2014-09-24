class SaleImportsController < ApplicationController
  def new
    @sale_import = SaleImport.new
  end

  def create
    log_file = LogFile.create(creator: current_user, updater: current_user)
    @sale_import = SaleImport.new(params[:sale_import])
    if @sale_import.save(current_user, log_file)
      redirect_to root_url, notice: import_message(log_file)
    else
      render :new
    end
  end

  private
    def import_message(log_file)
      "Imported sales successfully. $#{sprintf("%.2f", log_file.gross_revenue)} gross revenue," + 
      " #{log_file.sales.count} rows imported."
    end
end
