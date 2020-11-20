class CountFactorialsController < ApplicationController
  def input
  end

  def view
    @array_of_rows = FactorialAlgo.check_simon_theory
  end
end
