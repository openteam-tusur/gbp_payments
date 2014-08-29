class RegisterResponse
  def success(desc = nil)
    code = 1
    desc ||= 'OK'

    builder(code, desc).to_xml
  end

  def failure(desc = nil)
    code = 2
    desc ||= 'Temporary unavailable'

    builder(code, desc).to_xml
  end

  private

  def builder(code, desc)
    @builder ||= Nokogiri::XML::Builder.new do |xml|
      xml.send 'register-payment-response' do
        xml.send 'result' do
          xml.send 'code', code
          xml.send 'desc', desc
        end
      end
    end
  end
end
