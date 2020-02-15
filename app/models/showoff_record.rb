class ShowoffRecord
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  class RecordNotFound < StandardError; end

  attr_accessor :errors

  def initialize(attributes={})
    set_attributes attributes
    self.errors = ActiveModel::Errors.new(self )
  end

  def attributes=(attributes={})
    set_attributes attributes
    self
  end


  def persisted?
    id.present?
  end


  private

  def set_attributes(attributes={})
    attributes.each do |attr, value|
      self.public_send("#{attr}=", value)
    end
  end

end