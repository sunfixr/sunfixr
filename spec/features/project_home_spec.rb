require 'rails_helper'
describe 'The project home page' do
  let(:project){create(:project)}
  before :each do
    allow(Project).to receive(:find_by_slug).with('foo').and_return(create(:project,:with_address,:with_company))
  end
  it 'should display the project information' do
    visit '/project/foo'
    expect(page).to have_content 'Foo 1'

  end
end