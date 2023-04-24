class SaveFile
  def initialize(params)
    @params = params
  end

  def call(csv_file)
    csv_file.header =  @params[:header]
    csv_file.mapping = mapping.to_json
    csv_file.path = dump_file
    csv_file.status = :on_hold
    csv_file.save
  end

  private

  def dump_file
    local_path = Rails.root.join('files', "#{random_file_name}.csv" )
    LocalFile.mv(@params[:file].tempfile, local_path)
    local_path
  end

  def random_file_name
      Array.new(10) { [*'A'..'Z', *'a'..'z', *'0'..'9'].sample }.join
  end
  def mapping
    {
      name: @params[:name],
      birthdate: @params[:birthdate],
      phone: @params[:phone],
      address: @params[:address],
      credit_card_number: @params[:credit_card_number],
      email: @params[:email],
    }
  end
end