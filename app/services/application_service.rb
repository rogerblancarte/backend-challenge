class ApplicationService
  # abstract away the need to instantiate a new object in our services
  # everytime we want to use a service
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
