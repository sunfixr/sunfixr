require 'rails_helper'
describe 'The project home page' do
  let(:installation){create(:installation)}
  before :each do
    allow(Installation).to receive(:find_by_slug).with('foo').and_return(create(:installation))
  end
  it 'should display the installation information' do
    visit '/project/foo'
    expect(page).to have_content 'Foo 1'

  end
end