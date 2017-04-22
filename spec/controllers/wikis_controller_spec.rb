require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
  let(:user) {User.create(email: "test@mail.com", password: "password", role: "standard", confirmed_at: Time.now) }
  let(:wiki) {Wiki.create(user: user, title: "title", private: false, body: "body") }


  before :each do 
    sign_in user 
    sign_in premium_user
  end
  
  context "standard user user doing CRUD on a public wiki they own" do
    
      #########  GET SHOW  ########################
  
  
  describe "GET #show" do
    it "returns http success" do
      get :show, id: wiki.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, id: wiki.id
        expect(response).to render_template :show
    end
    
    it "assigns @wiki to user" do
      get :show, id: wiki.id
        expect(assigns(:wiki)).to eq(wiki)
      end
    
  end

########## GET #NEW ##########################

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @wiki" do
      get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    
  end
  
  ############ POST CREATE #####################
  
  describe "POST #create" do
    
    it "increases the number of Wikis by 1" do
      expect{ post :create, user_id: user.id, wiki: {title: "Title", body: "Body"} }.to change(Wiki,:count).by(1)
    end
    it "assigns the new post to @post" do
      post :create, user_id: user.id, wiki: {title: "Title", body: "Body"}
      expect(assigns(:wiki)).to eq Wiki.last
    end
    
    
    it "redirects to the newly created wiki" do
      post :create, wiki: {title: "title", body: "body"}
      expect(response).to redirect_to [Wiki.last]
    end
  
  end
  
  ############# GET EDIT #################################
  
  describe "GET #edit" do ####################
    
    it "returns http success" do
      get :edit, user_id: user.id, id: wiki.id 
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, user_id: user.id, id: wiki.id 
      expect(response).to render_template :edit
    end
    
    it "assigns wiki to be updated to @wiki" do
      get :edit, user_id: user.id, id: wiki.id 
      wiki_instance = assigns(:wiki)

      expect(wiki_instance.id).to eq wiki.id
      expect(wiki_instance.title).to eq wiki.title
      expect(wiki_instance.body).to eq wiki.body
    end
    
  end

  ############ PUT UPDATE ##############################3

  describe "PUT #update" do
    it "returns http success" do
    put :update, user_id: user.id, id: wiki.id, wiki: {title: "new_title", body: "new_body"}
      expect(response).to redirect_to([wiki])
    end
  end


  ################ DELETE DESTROY  ###########################3
  
  
  describe "DELETE #destroy" do
    it "deletes the wiki" do
      delete :destroy, user_id: user.id, id: wiki.id 
      count = Wiki.where({id: wiki.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to posts index" do
      delete :destroy, user_id: user.id, id: wiki.id
      expect(response).to redirect_to welcome_index_path
    end
    
  end



  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
  
  let(:standard_user) {User.create(email: "standard_user@mail.com", password: "password", role: "standard", confirmed_at: Time.now) }
  let(:premium_user) {User.create(email: "premium_user@mail.com", password: "password", role: "premium", confirmed_at: Time.now) }
  let(:private_wiki) {Wiki.create(user: premium_user, title: "private title", private: true, body: "body") }

context "premium user adding and removing a collaborator to a private wiki they own" do
  describe "POST #add_collaborator " do
    it "increases collaborator count by one" do
      post :add_collaborator, wiki_id: private_wiki.id, user: {user_id: standard_user.id}
      
      expect(Collaborator.count).to_increases by(1)
    end
  end

  
end
end
