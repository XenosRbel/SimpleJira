require 'rails_helper'

RSpec.describe PersonsController, type: :controller do
  describe 'GET index' do
    it 'redirect to the login template without auth' do
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end

    it 'renders the index template with auth' do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in(build_user, scope: :user)

      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'POST new' do
    it 'renders the new template for Admin' do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      sign_in(build_admin, scope: :user)

      post :new

      expect(response).to render_template('new')
    end

    it 'renders the new template for User' do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      sign_in(build_user, scope: :user)

      post :new

      expect(response.status).to_not eq(200)
    end

    it 'should new user with auth and role Admin' do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      sign_in(build_admin, scope: :user)

      post :create, params: {user: {email: 'qwe@qwe.qwe4', first_name: 'ASD',
                                    last_name: 'DSA', admin: 'Admin'},
                             format: :html}

      expect(response.status).to eq(200)
    end

    it 'should new user without auth' do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      sign_in(build_user, scope: :user)

      post :create, params: {user: {email: 'qwe@qwe.qwe4', first_name: 'ASD',
                                    last_name: 'DSA', admin: 'Admin'},
                             format: :html}

      expect(response.status).to eq(302)
    end
  end
end
