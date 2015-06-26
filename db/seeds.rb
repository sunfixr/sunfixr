

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

if Rails.env == 'development'
  User.create!([
                   {email: "admin@ditunga.com", password: 'admin123', encrypted_password: "$2a$10$A3wm0/fzrnXC52qShimAKuq8e.evOucuTaW43HZa3qxvsOyz3Q8f2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-06-25 16:05:09", last_sign_in_at: "2015-06-25 16:05:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: "e3b8f6509fe9b9ca7394cb425fe6b4154a9b4c810892daa5bbc1f4f38b4dac87", confirmed_at: "2015-06-25 16:04:55", confirmation_sent_at: "2015-06-25 16:02:34", unconfirmed_email: nil, role: nil, encrypted_authentication_token: "BXoYlfIEdNuFrN7Z5EZLBG12gi02iCdXcf0toCPuZhw=\n", encrypted_authentication_token_salt: nil, encrypted_authentication_token_iv: nil},
                   {email: "user@ditunga.com", password: 'user1234', encrypted_password: "$2a$10$6KC91nULODrDNikkfrKvC.wLew24A6ElCnXilM/CenkQeANMOGY7i", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, confirmation_token: "cf6f0c288d2d6c6e3da0df317010a2b22b316d6a438457625e3724280b68bd4a", confirmed_at: nil, confirmation_sent_at: "2015-06-25 16:18:36", unconfirmed_email: nil, role: nil, encrypted_authentication_token: "Vz/vEceVOJ2MNBUVTR7xfGimRU6dFbaVQvA9sDSE/HY=\n", encrypted_authentication_token_salt: nil, encrypted_authentication_token_iv: nil},
                   {email: "sunfixr@ditunga.com", password: 'sunixr123', encrypted_password: "$2a$10$mMdeQdD8CaA9iO.LC/ib..N2oWQdyDklzsCG8f6pjz.tqWC1Q0CL2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-06-25 18:59:16", last_sign_in_at: "2015-06-25 16:07:30", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: "ec22c06608242c6259841733ce16acd331759b2dc3034c814d51fdbb8736ba47", confirmed_at: "2015-06-25 16:07:14", confirmation_sent_at: "2015-06-25 16:06:14", unconfirmed_email: nil, role: nil, encrypted_authentication_token: "Jq017sL5tvPTlVmXXV1BFrNZa9zO8urg+gVrQU27Yvg=\n", encrypted_authentication_token_salt: nil, encrypted_authentication_token_iv: nil},
                   {email: "admin@sunfixr.com", password: 'admin123', encrypted_password: "$2a$10$8EhCYxU/JRcnCv/kx9u.BOHuV5p4D6EX6tNwL9AOUxqeerDn3fXCm", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-06-25 19:03:43", last_sign_in_at: "2015-06-25 16:07:58", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", confirmation_token: nil, confirmed_at: "2015-05-26 22:32:45", confirmation_sent_at: "2015-05-26 22:32:04", unconfirmed_email: nil, role: "admin", encrypted_authentication_token: "FlsekwJOIUY1zMuVebmNePWkZTi27VijbDPyxC6YRpg=\n", encrypted_authentication_token_salt: nil, encrypted_authentication_token_iv: nil}
               ])

  UsersProject.create!([
                           {user_id: 1, project_id: 1, role: ""},
                           {user_id: 2, project_id: 1, role: "admin"},
                           {user_id: 3, project_id: 1, role: "sunfixr"},
                           {user_id: 4, project_id: 1, role: "user"}
                       ])
  end
