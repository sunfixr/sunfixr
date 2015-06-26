
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
