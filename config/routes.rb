# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'article/preview/:id', to: 'admin#article_preview', as: :admin_article_preview
  get  'topic/preview/:id',   to: 'admin#topic_article_preview', as: :admin_topic_article_preview
  get  'cache/purge',   to: 'admin#purge_everything_cache', as: :admin_purge_everything_cache

  root 'home#index'

  get '/lp', to: 'lp#index'

  get  '/entry/lp',          to: 'entry#lp', as: :entry_lp
  get  '/entry',             to: 'entry#index'
  post '/entry/preview',     to: 'entry#preview', as: :entry_preview
  post '/entry/create',      to: 'entry#create',  as: :entry_create

  get  'service',     to: 'services#index', as: :services
  get  'article',     to: 'articles#index', as: :articles
  get  'article/:id', to: 'articles#show',  as: :article

  get  'search', to: 'search#show', as: :search

  get  'advisers/:id', to: 'tax_accountants#show', as: :tax_accountant

  get  'contact',             to: 'contacts#index',   as: :contacts
  get  'thanks',             to: 'contacts#thanks',   as: :thanks
  post 'contact/preview',     to: 'contacts#preview', as: :contact_preview
  post 'contact/create',      to: 'contacts#create',   as: :contact_create

  scope module: :topics do
    get  't_1', to: 't1#index', as: :t1
    get  't_2', to: 't2#index', as: :t2
    get  't_3', to: 't3#index', as: :t3
    get  't_4', to: 't4#index', as: :t4
    get  't_5', to: 't5#index', as: :t5
    get  't_6', to: 't6#index', as: :t6
    get  't_7', to: 't7#index', as: :t7
    get  't_8', to: 't8#index', as: :t8
    get  't_9', to: 't9#index', as: :t9
  end

  get  ':t_id/:id', to: 'topics#show', as: :topic_article

  get  'terms',     to: 'policies#terms',   as: :terms
  get  'privacy',   to: 'policies#privacy', as: :privacy

  scope :api, format: 'json' do
    get 'home', to: 'home#index'
  end

  get '/sitemap.xml.gz', to: redirect('https://minnano-zeirishi.s3-ap-northeast-1.amazonaws.com/sitemap.xml.gz')
end
