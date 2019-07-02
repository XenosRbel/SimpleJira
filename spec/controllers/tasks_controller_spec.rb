require 'rails_helper'

RSpec.describe TasksController, type: :controller do
	describe 'get index' do
		it 'should return 302 without authorization ' do
			get :index
			expect(response.status).to eql(302)
		end
		
		it 'should return 200 with authorization' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			get :index
			expect(response.status).to eql(200)
		end
	end
	
	describe 'get edit' do
		fake_task = FactoryBot.create(:task)
		
		it 'should return to 302 without authorization' do
			get :edit, params: {id: fake_task.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			get :edit, params: {id: fake_task.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 200 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_admin, scope: :users)
			
			get :edit, params: {id: fake_task.id, format: :html}
			expect(response.status).to eql(200)
		end
	end
	
	describe 'delete destroy' do
		fake_task = FactoryBot.create(:task)
		
		it 'should return to 302 without authorization' do
			delete :destroy, params: {id: fake_task.id}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			delete :destroy, params: {id: fake_task.id}
			expect(response.status).to eql(302)
		end
		
		it 'should return to index with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_admin, scope: :users)
			
			delete :destroy, params: {id: fake_task.id}
			expect(response).to redirect_to('/tasks')
		end
	end
	
	describe 'post create' do
		fake_task = FactoryBot.create(:task)
		
		it 'should return to 302 without authorization' do
			fake_user = FactoryBot.create(:user)
			
			post :create, params: {task: {title: fake_task.title, content: fake_task.content, comments: fake_task.comments,
			                              status: fake_task.status, start_date: fake_task.start_date,
			                              due_date: fake_task.due_date, estimation: fake_task.estimation, project_id: fake_task.project.id, user_id: fake_user.id}}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			fake_user = FactoryBot.create(:user)
			
			post :create, params: {task: {title: fake_task.title, content: fake_task.content, comments: fake_task.comments,
			                              status: fake_task.status, start_date: fake_task.start_date,
			                              due_date: fake_task.due_date, estimation: fake_task.estimation, project_id: fake_task.project.id, user_id: fake_user.id}}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_admin, scope: :users)
			
			fake_user = FactoryBot.create(:user)
			
			post :create, params: {task: {title: fake_task.title, content: fake_task.content, comments: fake_task.comments,
			                              status: fake_task.status, start_date: fake_task.start_date,
			                              due_date: fake_task.due_date, estimation: fake_task.estimation, project_id: fake_task.project.id, user_id: fake_user.id}}
			expect(response.status).to eql(302)
		end
	end
end
