require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
	describe 'get index' do
		it 'should return 302 without authorization ' do
			get :index
			expect(response.status).to eql(302)
		end
		
		it 'should return 200 with authorization' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_user, scope: :user)
			
			get :index
			expect(response.status).to eql(200)
		end
	end
	
	describe 'get edit' do
		fake_team = FactoryBot.create(:team)
		
		it 'should return to 302 without authorization' do
			get :edit, params: {id: fake_team.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_user, scope: :user)
			
			get :edit, params: {id: fake_team.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 200 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_admin, scope: :user)
			
			get :edit, params: {id: fake_team.id, format: :html}
			expect(response.status).to eql(200)
		end
	end
	
	describe 'delete destroy' do
		fake_team = FactoryBot.create(:team)
		
		it 'should return to 302 without authorization' do
			delete :destroy, params: {id: fake_team.id}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_user, scope: :user)
			
			delete :destroy, params: {id: fake_team.id}
			expect(response.status).to eql(302)
		end
		
		it 'should return to index with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_admin, scope: :user)
			
			delete :destroy, params: {id: fake_team.id}
			expect(response).to redirect_to('/teams')
		end
	end
	
	describe 'post create' do
		fake_team = FactoryBot.create(:team)
		
		it 'should return to 302 without authorization' do
			post :create, params: {team: {name: fake_team.name}}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_user, scope: :user)
			
			post :create, params: {team: {name: fake_team.name}}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_admin, scope: :user)
			
			post :create, params: {team: {name: fake_team.name}}
			expect(response.status).to eql(302)
		end
	end
end
