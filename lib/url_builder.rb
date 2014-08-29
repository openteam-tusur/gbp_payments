class UrlBuilder
  include Rails.application.routes.url_helpers

  def initialize(payment)
    @payment = payment
  end

  def url
    uri = URI.parse('https://test.pps.gazprombank.ru:443/payment/start.wsm')

    parameters = {
      :merch_id => @payment.merch_id,
      :back_url_s => root_url(:host => 'http://localhost:3000'),
      :back_url_f => root_url(:host => 'http://localhost:3000'),
      :o => {
        :payment_id => @payment.id
      }
    }

    uri.query = parameters.to_query
    uri.to_s
  end
end
