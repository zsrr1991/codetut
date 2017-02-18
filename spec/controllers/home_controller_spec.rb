require "rails_helper"

describe HomeController do
	describe 'GET #index' do
		it 'responds successfully' do
			get :index
			expect(response).to be_success
		end
		it 'renders template index' do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe 'GET #about' do
		it 'responds successfully' do
			get :about
			expect(response).to be_success
		end
		it 'renders template about' do
			get :about
			expect(response).to render_template(:about)
		end

	end

	describe 'GET #terms' do
		it 'response successfully' do
			get :terms
			expect(response).to be_success
		end
		it 'renders template terms' do
			get :terms
			expect(response).to render_template(:terms)
		end
	end
end