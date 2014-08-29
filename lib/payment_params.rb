class PaymentParams
  def initialize(raw_params, kind)
    @kind = kind
    @raw_params = ActionController::Parameters.new(raw_params)
  end

  def permitted
    params = case @kind
    when 'hostel'
      @raw_params.permit(:payment => [:full_name, :number, :amount])
    when 'internet'
      @raw_params.permit(:payment => [:full_name, :number, :amount])
    when 'education'
      @raw_params.permit(:payment => [:full_name, :number, :amount])
    else
      {}
    end

    params[:payment]
  end
end
