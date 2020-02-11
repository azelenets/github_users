# frozen_string_literal: true

class ApplicationService
  class << self
    def call(*args)
      new(*args).call
    end
  end

  def initialize
    raise NotImplementedError
  end

  def call
    raise NotImplementedError
  end
end
