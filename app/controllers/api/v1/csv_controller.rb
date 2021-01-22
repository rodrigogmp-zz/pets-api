class Api::V1::CsvController < ApplicationController

  require 'csv'

  def create
    send_data Csvs::CreateService.call(params: csv_params), filename: "pets-#{Date.today}.csv"
  end

  private

  def csv_params
    params.require(:birthday_date)
    params.require(:medicine)
    params.permit(:birthday_date, :medicine)
  end
end
