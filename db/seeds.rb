User.create!([
  {email: "admin@sunfixr.com", encrypted_password: "$2a$10$bR.bjZZ8BW3JvPHJJ/CxNu2bjVK9RXWZ9yM24eMdDqq9sl7ebUBQ.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-26 22:34:01", last_sign_in_at: "2015-05-26 22:34:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2015-05-26 22:32:45", confirmation_sent_at: "2015-05-26 22:32:04", unconfirmed_email: nil, role: nil, encrypted_authentication_token: "FlsekwJOIUY1zMuVebmNePWkZTi27VijbDPyxC6YRpg=\n", encrypted_authentication_token_salt: nil, encrypted_authentication_token_iv: nil}
  ])
Address.create!([
  {addressable_id: 1, addressable_type: "Project", name: "Ditunga", address1: "1212 Ditunga rd.", address2: "", city: "Ngandajika", state: "KW", postal_code: "1212abc", country_id: "CD", latitude: "-6.75", longitude: "23.967"}
])
CompaniesProject.create!([
  {project_id: 1, company_id: 1}
])
Company.create!([
  {name: "Borney", notes: nil},
  {name: "Enphase", notes: nil},
  {name: "Solindra", notes: nil},
  {name: "Batteries R Us", notes: nil}
])
Component.create!([
  {component_type_id: 2, company_id: 3, name: "10 260 Watt Renesola PV Modules (20 year linear degradation)", description: "10 260 Watt Renesola PV Modules (20 year linear degradation)", part_number: "1234567", serial_number: nil, comments: "(20 year linear degradation)"},
  {component_type_id: 1, company_id: 2, name: "10KW inverter", description: "Big inverter", part_number: "1234", serial_number: nil, comments: "sfsdffsdafdafa"},
  {component_type_id: 3, company_id: 4, name: "10 KW Battery", description: "A big Battery", part_number: "asdfgh", serial_number: nil, comments: "Imaginary battery"}
])
ComponentType.create!([
  {name: "Inverter"},
  {name: "Solar Panel"},
  {name: "Battery"}
])
ComponentsProject.create!([
  {component_id: 1, project_id: 1},
  {component_id: 2, project_id: 1},
  {component_id: 3, project_id: 1}
])
LogEntry.create!([
  {project_id: 1, component_id: "3", user: "Bob", comments: "checked battery water levels"}
])
Project.create!([
  {name: "Ditunga", slug: "ditunga", description: "A nice solar installation in the DRC", install_date: "2006-05-18"}
])
