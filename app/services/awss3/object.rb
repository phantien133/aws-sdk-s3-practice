class AWSS3::Object < AWSS3::Base
  FOLDER_CONTENT_TYPE = "application/x-directory"
  CONTENT_TYPES = {
    folder: "application/x-directory",
    json: "application/json"
  }

  attr_reader :key, :object, :basename, :extname, :file_name
  alias_method :s3_object, :object

  def initialize key
    @object =
      case key
      when Aws::S3::ObjectSummary
        key.object
      when Aws::S3::Object
        key
      when String
        AWSS3::Base.bucket.object key
      else
        raise ArgumentError
      end
    @key = @object.key
    detect_file_names
  end

  def body
    @body ||= object.get.body.string
  end

  def to_json!
    JSON.parse body
  end

  def json?
    object.content_type == CONTENT_TYPES[:json]
  end

  def folder?
    object.content_type == CONTENT_TYPES[:folder]
  end

  def move_to destination
    s3_destination = case destination
                when Aws::S3::Object, Hash, String
                  destination
                when AWSS3::Object
                  destination.s3_object
                when AWSS3::Folder
                  {
                    bucket: destination.s3_object.bucket.name,
                    key: (destination.key + basename)
                  }
                else
                  raise ArgumentError
                end
    s3_object.move_to s3_destination
  end

  private
  def detect_file_names
    @basename = File.basename key
    @extname = File.extname key
    @file_name = @basename.chomp @extname
  end
end
