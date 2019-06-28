require 'rails_helper'

RSpec.describe PostsController, type: :controller do
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
		it 'should return to 302 without authorization' do
			get :edit, params: {id: 1, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_user, scope: :user)
			
			fake_post = FactoryBot.create(:post)
			
			get :edit, params: {id: fake_post.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 200 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_admin, scope: :user)
			
			fake_post = FactoryBot.create(:post)
			
			get :edit, params: {id: fake_post.id, format: :html}
			expect(response.status).to eql(200)
		end
	end
	
	describe 'post create' do
		it 'should return to 302 without authorization' do
			get :edit, params: {}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_user, scope: :user)
			
			get :edit, params: {}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 200 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:user]
			sign_in(build_admin, scope: :user)
			
			get :edit, params: {}
			expect(response.status).to eql(200)
		end
	end
	
	describe 'delete update' do
	
	end
end
