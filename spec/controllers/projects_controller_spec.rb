require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
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
		it 'should return to 302 without authorization' do
			fake_project = FactoryBot.create(:project)
			
			get :edit, params: {id: fake_project.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			fake_project = FactoryBot.create(:project)
			
			get :edit, params: {id: fake_project.id, format: :html}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 200 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_admin, scope: :users)
			
			fake_project = FactoryBot.create(:project)
			
			get :edit, params: {id: fake_project.id, format: :html}
			expect(response.status).to eql(200)
		end
	end
	
	describe 'delete destroy' do
		it 'should return to 302 without authorization' do
			fake_project = FactoryBot.create(:project)
			
			delete :destroy, params: {id: fake_project.id}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			fake_project = FactoryBot.create(:project)
			
			delete :destroy, params: {id: fake_project.id}
			expect(response.status).to eql(302)
		end
		
		it 'should return to index with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_admin, scope: :users)
			
			fake_project = FactoryBot.create(:project)
			
			delete :destroy, params: {id: fake_project.id}
			expect(response).to redirect_to('/projects')
		end
	end
	
	describe 'post create' do
		it 'should return to 302 without authorization' do
			fake_team = FactoryBot.create(:team)
			fake_project = FactoryBot.create(:project)
			
			post :create, params: {project: {name: fake_project.name, summary: fake_project.summary, start_date: fake_project.start_date,
			                                 end_date: fake_project.end_date, project_id: fake_team.id}}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 302 with authorization & role User' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			fake_team = FactoryBot.create(:team)
			fake_project = FactoryBot.create(:project)
			
			post :create, params: {project: {name: fake_project.name, summary: fake_project.summary, start_date: fake_project.start_date,
			                                 end_date: fake_project.end_date, project_id: fake_team.id}}
			expect(response.status).to eql(302)
		end
		
		it 'should return to 200 with authorization & role Admin' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_admin, scope: :users)
			
			fake_team = FactoryBot.create(:team)
			fake_project = FactoryBot.create(:project)
			
			post :create, params: {project: {name: fake_project.name, summary: fake_project.summary, start_date: fake_project.start_date,
			                                 end_date: fake_project.end_date, project_id: fake_team.id}}
			expect(response.status).to eql(200)
		end
	end
end
