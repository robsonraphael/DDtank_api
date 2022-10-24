Rails.application.routes.draw do
  get '/basic/:level', to: 'attributes#basic'

  get '/force/:level', to: 'attributes#force'
end
