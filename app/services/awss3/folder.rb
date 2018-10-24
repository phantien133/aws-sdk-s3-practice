class AWSS3::Folder < AWSS3::Base
  FOLDER_SUFFIX = "/"

  attr_reader :folder, :objects, :key, :s3_object

  def initialize folder_key
    @key = folder_key
    add_folder_suffix
    @s3_object = AWSS3::Base.bucket.object @key
    @folder = AWSS3::Object.new @s3_object
    raise "Object #{folder_key} isn't folder" unless @folder.folder?
    @objects = load_objects
  end

  def load_objects limit: nil
    AWSS3::Base.bucket.objects(prefix: @key).limit limit
  end

  def each &block
    objects.each do |object|
      instance = AWSS3::Object.new object
      next if folder_object?(object)
      block.call instance
    end
  end

  private
  def folder_object? object
    object.key == @key
  end

  def add_folder_suffix
    @key += FOLDER_SUFFIX if @key.last != FOLDER_SUFFIX
  end
end
