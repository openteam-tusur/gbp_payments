class PaymentsController < ApplicationController
  before_filter :build_payment, :only => [:new, :create]
  before_filter :find_payment, :only => [:check]

  http_basic_authenticate_with :name => Settings['http_basic_auth.login'],
    :password => Settings['http_basic_auth.password'],
    :only => [:check, :register]

  def create
    if @payment.save
      redirect_to UrlBuilder.new(@payment).url
    else
      render :new
    end
  end

  def check
    p '=== CHECK ==='
    p params

    render :xml => CheckResponse.new.success(@payment)
  end

  def register
    p '=== REGISTER ==='
    p params

    render :xml => RegisterResponse.new.success
  end

  private

  def build_payment
    kind = params[:kind]

    klass = PaymentClass.new(kind).klass
    attributes = PaymentParams.new(params, kind).permitted

    @payment = klass.new(attributes)
  end

  def find_payment
    @payment = Payment.first
  end
end
