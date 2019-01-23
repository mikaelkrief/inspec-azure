resource_group = attribute('resource_group', default: nil)
loadbalancer_name = attribute('lb_name', default: nil)

control 'azurerm_load_balancer' do

  describe azurerm_load_balancer(resource_group: resource_group, loadbalancer_name: loadbalancer_name) do
    it                { should exist }
    its('id')         { should_not be_nil }
    its('name')       { should eq loadbalancer_name }
    its('sku')        { should_not be_nil }
    its('location')   { should_not be_nil }
    its('type')       { should eq 'Microsoft.Network/loadBalancers' }
    its('loadbalancing_rules') {should_not be_empty}
    its('inbound_nat_pools') {should be_empty}
  end
end
