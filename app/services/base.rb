module Base
  extend ActiveSupport::Concern

  class_methods do
    def execute! *args, &block
      @instance ||= new
      @instance.execute!(*args, &block)
    end
  end

  def execute!
    raise NotImplementedError
  end
end
