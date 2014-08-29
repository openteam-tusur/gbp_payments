class PaymentClass
  attr_accessor :klass

  def initialize(kind)
    @klass = Payment.descendants.select { |d| d.kind == kind }.first
  end
end
