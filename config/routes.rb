Rails.application.routes.draw do
  root :to => 'welcome#index'

  EducationPayment; HostelPayment; InternetPayment unless Rails.env.production?
  Payment.descendants.map(&:kind).each do |kind|
    get "/payments/#{kind}/new" => 'payments#new', :defaults => { :kind => kind }

    post "/payments/#{kind}" => 'payments#create', :defaults => { :kind => kind }
  end

  get '/payments/check'    => 'payments#check'
  get '/payments/register' => 'payments#register'
end
