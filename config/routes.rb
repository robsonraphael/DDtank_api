Rails.application.routes.draw do
  get 'attribute/basic', to: 'attributes#basic'

  get 'attribute/basic/up', to: 'attributes#up_basic'

  get 'attribute/force', to: 'attributes#force'

  get 'equipament/basic', to: 'equipaments#basic'

  get 'equipament/weapon', to: 'equipaments#weapon'
end
