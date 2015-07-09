RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
   config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard  do   # mandatory
      except ['CompaniesProject','ComponentsProject']
    end
    index    do                     # mandatory
      except ['CompaniesProject','ComponentsProject']
    end
    new
    export
    bulk_delete
    show do
      except ['CompaniesProject','ComponentsProject']
    end
    edit do
      except ['CompaniesProject','ComponentsProject']
    end
    delete
    show_in_app do
      except ['CompaniesProject','ComponentsProject']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    edit do
      field :email
      field :role
    end

  end

  config.model 'Project' do
    create do
      field :name
      field :slug
      field :company
      field :description
      field :install_date
      field :address
    end
    edit do
      field :name
      field :slug
      field :company
      field :description
      field :install_date
      field :address
      field :components
      field :log_entries
    end
  end

  config.model 'Company' do
    create do
      field :name
      field :address
      field :notes
    end
    edit do
      field :name
      field :notes
      field :components
      field :projects
    end
  end
    config.model 'Component' do
      create do
        field :name
        field :company
        field :component_type
        field :description
        field :part_number
        field :comments
      end
      edit do
        field :name
        field :company
        field :component_type
        field :description
        field :part_number
        field :comments
        field :log_entries
        field :projects
      end
    end

  config.model 'Address' do
    create do
      field :name
      field :address1
      field :address2
      field :city
      field :state, :enum do
        active false
        label 'You can choose a state when editing'
        enum{[]}
      end
      field :postal_code
      field :country_id, :enum do
        enum do
          ISO3166::Country.all
        end
      end
      field :latitude
      field :longitude
    end

    edit do
      field :name
      field :address1
      field :address2
      field :city
      field :state, :enum do
        enum do
           ISO3166::Country.find_country_by_alpha2(bindings[:object].country_id).states.map {|k,v| [v['name'],k]}
        end
      end
      field :postal_code
      field :country_id, :enum do
        enum do
          ISO3166::Country.all
        end
      end
      field :latitude
      field :longitude
    end

     show do
      field :name
      field :address1
      field :address2
      field :city
      field :state
      field :postal_code
      field :country_id, :enum do
        enum do
          ISO3166::Country.all
        end
      end
      field :latitude
      field :longitude
    end

  end

end
