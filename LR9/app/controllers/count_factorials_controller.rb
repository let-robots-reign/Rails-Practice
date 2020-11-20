class CountFactorialsController < ApplicationController
  def input
  end

  def view
    @array_of_rows = FactorialAlgo.check_simon_theory

    respond_to do |format|
      format.html
      format.json do
        render json: {table_rows: @array_of_rows}
      end
    end
  end
end
