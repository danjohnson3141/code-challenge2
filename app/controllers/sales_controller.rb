class SalesController < ApplicationController
  def index
    @sales = Sale.order("created_at DESC, purchaser_name").where(log_file_id: params[:log_file_id])
    respond_to do |format|
      format.html
      format.csv { send_data @sales.to_csv }
      format.xls
    end
  end
end
