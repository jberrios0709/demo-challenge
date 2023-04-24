class CsvFilesController < ApplicationController
  before_action :csv_file, only: [:new, :header, :create]

  def new
  end

  def header
    @csv_file.header = params['header']
  end

  def create
    SaveFile.new(params_permit).call(@csv_file)
    return render :header, status: :unprocessable_entity unless @csv_file.save

    # Move to job in sidekiq
    ParseFile.new(@csv_file).call
    redirect_to files_path
  end

  private

  def csv_file
    @csv_file = CsvFile.new(user: current_user)
  end

  def params_permit
    params.require(:csv_file).permit(:name, :birthdate, :phone, :address, :credit_card_number, :email, :header, :file)
  end
end
