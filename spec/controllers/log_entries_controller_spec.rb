require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe LogEntriesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # LogEntry. As you add validations to LogEntry, be sure to
  # adjust the attributes here as well.
  let(:installation){FactoryGirl.create(:installation)}
  let(:valid_attributes) {
    {user: 'Joe', comments: 'Some comments', installation_id: installation.id}
  }

  let(:invalid_attributes) {
    {user: '', comments: ''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LogEntriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all log_entries as @log_entries" do
      log_entry = LogEntry.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:log_entries)).to eq([log_entry])
    end
  end

  describe "GET show" do
    it "assigns the requested log_entry as @log_entry" do
      log_entry = LogEntry.create! valid_attributes
      get :show, {:id => log_entry.to_param}, valid_session
      expect(assigns(:log_entry)).to eq(log_entry)
    end
  end

  describe "GET new" do
    it "assigns a new log_entry as @log_entry" do
      get :new, {}, valid_session
      expect(assigns(:log_entry)).to be_a_new(LogEntry)
    end
  end

  describe "GET edit" do
    it "assigns the requested log_entry as @log_entry" do
      log_entry = LogEntry.create! valid_attributes
      get :edit, {:id => log_entry.to_param}, valid_session
      expect(assigns(:log_entry)).to eq(log_entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LogEntry" do
        expect {
          post :create, {:log_entry => valid_attributes}, valid_session
        }.to change(LogEntry, :count).by(1)
      end

      it "assigns a newly created log_entry as @log_entry" do
        post :create, {:log_entry => valid_attributes}, valid_session
        expect(assigns(:log_entry)).to be_a(LogEntry)
        expect(assigns(:log_entry)).to be_persisted
      end

      it "redirects to the created log_entry" do
        post :create, {:log_entry => valid_attributes}, valid_session
        expect(response).to redirect_to(LogEntry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved log_entry as @log_entry" do
        post :create, {:log_entry => invalid_attributes}, valid_session
        expect(assigns(:log_entry)).to be_a_new(LogEntry)
      end

      it "re-renders the 'new' template" do
        post :create, {:log_entry => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_installation){FactoryGirl.create(:installation,name: 'new install', slug: 'newslug')}
      let(:new_attributes) {
        {user: 'Bob', comments: 'Some new comments', installation_id: new_installation.id}
      }

      it "updates the requested log_entry" do
        log_entry = LogEntry.create! valid_attributes
        put :update, {:id => log_entry.to_param, :log_entry => new_attributes}, valid_session
        log_entry.reload
        expect(log_entry.user).to eq 'Bob'
        expect(log_entry.comments).to eq 'Some new comments'
        expect(log_entry.installation).to eq new_installation
      end

      it "assigns the requested log_entry as @log_entry" do
        log_entry = LogEntry.create! valid_attributes
        put :update, {:id => log_entry.to_param, :log_entry => valid_attributes}, valid_session
        expect(assigns(:log_entry)).to eq(log_entry)
      end

      it "redirects to the log_entry" do
        log_entry = LogEntry.create! valid_attributes
        put :update, {:id => log_entry.to_param, :log_entry => valid_attributes}, valid_session
        expect(response).to redirect_to(log_entry)
      end
    end

    describe "with invalid params" do
      it "assigns the log_entry as @log_entry" do
        log_entry = LogEntry.create! valid_attributes
        put :update, {:id => log_entry.to_param, :log_entry => invalid_attributes}, valid_session
        expect(assigns(:log_entry)).to eq(log_entry)
      end

      it "re-renders the 'edit' template" do
        log_entry = LogEntry.create! valid_attributes
        put :update, {:id => log_entry.to_param, :log_entry => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested log_entry" do
      log_entry = LogEntry.create! valid_attributes
      expect {
        delete :destroy, {:id => log_entry.to_param}, valid_session
      }.to change(LogEntry, :count).by(-1)
    end

    it "redirects to the log_entries list" do
      log_entry = LogEntry.create! valid_attributes
      delete :destroy, {:id => log_entry.to_param}, valid_session
      expect(response).to redirect_to(log_entries_url)
    end
  end

end
