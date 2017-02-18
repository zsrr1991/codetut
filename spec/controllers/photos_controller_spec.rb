require "rails_helper"
describe PhotosController do
	describe "GET #index" do
		it "responds successfully and renders index template" do
			get :index
			expect(response).to be_success
			expect(response).to render_template(:index)
		end
		
		it "populates array of photos" do
			photo1 = create(:photo)
			photo2 = create(:photo)
			get :index
			expect(assigns(:photos)).to contain_exactly(photo1, photo2)
		end
	end
	
	describe "GET #show" do
		it "responds successfully and renders show template" do
			photo = create(:photo)
			get :show, params: { id: photo.id }
			expect(response).to be_success
			expect(response).to render_template(:show)
		end

		it "assigns requested photo to @photo" do
			photo = create(:photo)
			get :show, params: { id: photo.id }
			expect(assigns(:photo)).to eq photo
		end
	end

	describe "GET #new" do
		it "responds successfully and renders new template" do
			get :new
			expect(response).to be_success
			expect(response).to render_template(:new)
		end

		it "assigns new Photo to @photo" do
			get :new
			expect(assigns(:photo)).to be_a_new(Photo)
		end
	end
	
	describe "GET #edit" do
		it "response successfully and renders new template" do
			photo = create(:photo)
			get :edit, params: {id: photo}
			expect(response).to be_success
			expect(response).to render_template(:edit)
		end

		it "assings requested photo to @photo" do
			photo = create(:photo)
			get :edit, params:{id:photo}
			expect(assigns(:photo)).to eq photo
		end
	end
	describe "POST #create" do
		context "with valid attributes" do
			it "save new photo" do
				expect {
					post :create, params:{photo:{title: "tytuł", description: "opis"}}
				}.to change(Photo, :count).by(1)
			end
			
			it "redirects to show page" do
				post :create, params: { photo: { title: 'Tytuł', description: 'Opis' }}
				expect(response).to redirect_to photo_path(1)
			end
		end
	end

end


