aws_access_args = %i(access_key_id secret_access_key).map{|key| Rails.application.credentials.dig :aws, key}
aws_config = {
  region: Rails.application.credentials.dig(:aws, :region),
  credentials: Aws::Credentials.new(*aws_access_args)
}
Aws.config.update aws_config
