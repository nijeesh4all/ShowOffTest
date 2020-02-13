class ShowoffRecord

  attr_accessor :errors

  def initialize(attributes={})
    attributes.each do |attr, value|
      self.public_send("#{attr}=", value)
    end
  end

  def persisted?
    id.present?
  end

end