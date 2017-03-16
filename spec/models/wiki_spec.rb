require 'rails_helper'

RSpec.describe Wiki, type: :wiki do
  let(:user) {User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
  let(:wiki) {Wiki.create(user: user, title: "title", body: "body") }

  it { is_expected.to belong_to(:user) }
  
   describe "attributes" do
     it "has a title, body, and user attribute" do
       expect(wiki).to have_attributes(title: wiki.title, body: wiki.body)
     end
   end
  
end
