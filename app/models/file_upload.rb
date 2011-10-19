class FileUpload < ActiveRecord::Base
  attr_accessible :upload

  def self.get_name(file)
    return file.original_filename
  end

  def self.file_upload(file)
#       File.open("#{RAILS_ROOT}/public", "wb") do |f|
#         f.write(file.read)
#       end
       return true
  end

    def self.get_type(file)
      return File.extname(file.original_filename) 
    end
end
