class SalesController < ApplicationController
  def index
    @sales = Sale.order(:purchaser_name)
    respond_to do |format|
      format.html
      format.csv { send_data @sales.to_csv }
      format.xls # { send_data @sales.to_csv(col_sep: "\t") }
    end
  end
end
