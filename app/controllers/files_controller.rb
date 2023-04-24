class FilesController < ApplicationController
  def index
    @files = CsvFile.where(user: current_user)
  end
end
