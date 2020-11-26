class CountFactorialsController < ApplicationController
  before_action :parse_params, only: :view

  def input; end

  def view
    if (res_array = FactorialAlgo.find_by_max_n(@max_n))
      @db_logs = "В БД уже есть эта запись"
      @array_of_rows = ActiveSupport::JSON::decode(res_array.result)
    else
      @db_logs = "В БД нет кэшированных записей, вычисляем..."
      @array_of_rows = FactorialAlgo.check_simon_theory(@max_n)
      res_array = FactorialAlgo.create :max_n => @max_n,
                                       :result => ActiveSupport::JSON::encode(@array_of_rows)
      res_array.save
    end

    respond_to do |format|
      format.html
      format.json do
        render json: {table_rows: @array_of_rows, db_logs: @db_logs}
      end
    end
  end

  protected

  def parse_params
    @max_n = params[:max_n].to_i
  end
end
