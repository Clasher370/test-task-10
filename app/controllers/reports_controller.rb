class ReportsController < ApplicationController
  def by_author
    SendReportJob.perform_later(params[:start_date],
                                params[:end_date],
                                params[:email])

    render json: { 'message' => 'Report generation started' }, status: :ok
  end
end
