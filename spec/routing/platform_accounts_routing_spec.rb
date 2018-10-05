# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlatformAccountsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/platform_accounts').to route_to('platform_accounts#index')
    end

    it 'routes to #new' do
      expect(get: '/platform_accounts/new').to route_to('platform_accounts#new')
    end

    it 'routes to #show' do
      expect(get: '/platform_accounts/1')
        .to route_to('platform_accounts#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/platform_accounts/1/edit')
        .to route_to('platform_accounts#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/platform_accounts').to route_to('platform_accounts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/platform_accounts/1')
        .to route_to('platform_accounts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/platform_accounts/1')
        .to route_to('platform_accounts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/platform_accounts/1')
        .to route_to('platform_accounts#destroy', id: '1')
    end
  end
end
