class Payment < ActiveRecord::Base
  validates :full_name, :presence => true
  validates :number, :presence => true
  validates :amount, :presence => true

  def self.kind
    name.underscore.gsub '_payment', ''
  end

  %w[merch_id account_id short_desc long_desc].each do |name|
    define_method name do
      Settings["merchants.#{self.class.kind}.#{name}"]
    end
  end
end
