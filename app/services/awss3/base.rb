class AWSS3::Base
  class << self
    def bucket
      @bucket ||= load_bucket
    end

    def load_bucket bucket_name: nil, resource: {}
      bucket_name = Rails.application.credentials.dig :aws, :bucker_name if bucket_name.blank?
      Aws::S3::Resource.new.bucket bucket_name
    end
  end
end
