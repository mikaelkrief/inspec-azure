resource_group = attribute('resource_group', default: nil)
webapp_name = attribute('webapp_name', default: nil)

control 'azurerm_webapps' do
  describe azurerm_webapps(resource_group: resource_group) do
    it { should exist }
    its('names') { should include webapp_name }
  end
end
