class CheckResponse
  def success(payment, desc = nil)
    code = 1
    desc ||= 'OK'
    currency = 643
    exponent = 2

    builder ||= Nokogiri::XML::Builder.new do |xml|
      xml.send 'payment-avail-response' do
        xml.send 'result' do
          xml.code code
          xml.desc desc
        end

        xml.send 'merchant-trx', payment.id

        xml.send 'purchase' do
          xml.send 'shortDesc', payment.short_desc
          xml.send 'longDesc',  payment.long_desc

          xml.send 'account-amount' do
            xml.send 'id',       payment.account_id
            xml.send 'amount',   payment.amount
            xml.send 'currency', currency
            xml.send 'exponent', exponent
          end
        end
      end
    end

    builder.to_xml
  end

  def failure(desc = nil)
    code = 2
    desc ||= 'Unable to accept this payment'

    builder = Nokogiri::XML::Builder.new do |xml|
      xml.send 'payment-avail-response' do
        xml.send 'result' do
          xml.send 'code', code
          xml.send 'desc', desc
        end
      end
    end

    builder.to_xml
  end
end
