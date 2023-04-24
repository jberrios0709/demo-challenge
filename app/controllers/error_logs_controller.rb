class ErrorLogsController < ApplicationController
  def index
    @error_logs = ErrorLog.joins(:csv_file).where(csv_files: { user: current_user })
  end
end
