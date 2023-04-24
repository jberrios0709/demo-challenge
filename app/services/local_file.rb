class LocalFile
  class << self
    def mv(current_path, new_path)
      FileUtils.mv(current_path, new_path)
    end

    def delete(path: nil)
      return if path.blank?

      ::Dir.delete(path) if ::Dir.exist?(path)
    end
  end
end