require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	describe 'post create' do
		it 'should redirect to sign in if try create comment without authorization' do
			fake_post = FactoryBot.create(:post)
			post :create, params: {comment: {content: 'My comment'}, post_id: fake_post.id, format: :html}
			
			expect(response).to redirect_to('/users/sign_in')
		end
		
		it 'should return 302 if try create comment with authorization' do
			@request.env['devise.mapping'] = Devise.mappings[:users]
			sign_in(build_user, scope: :users)
			
			fake_post = FactoryBot.create(:post)
			
			post :create, params: {comment: {content: 'My comment'}, post_id: fake_post.id, format: :html}
			
			expect(response.status).to eql(302)
		end
	end
end
