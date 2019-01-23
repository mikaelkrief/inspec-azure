# frozen_string_literal: true

require 'azurerm_resource'

class AzurermLoadBalancer < AzurermSingularResource
  name 'azurerm_load_balancer'
  desc 'Verifies settings for an Azure Load Balancer'
  example <<-EXAMPLE
    describe azurerm_load_balancer(resource_group: 'rg-1', loadbalancer_name: 'lb-1') do
      it { should exist }
    end
  EXAMPLE

  ATTRS = %i(
    id
    name
    location
    type
    sku
    properties
  ).freeze

  attr_reader(*ATTRS)

  def initialize(resource_group: nil, loadbalancer_name: nil)
    loadbalancer = management.load_balancer(resource_group, loadbalancer_name)
    return if has_error?(loadbalancer)

    assign_fields(ATTRS, loadbalancer)

    @resource_group = resource_group
    @loadbalancer_name = loadbalancer_name
    @exists = true
  end

  def loadbalancing_rules
    management.load_balancer_rules(@resource_group, @loadbalancer_name)
  end


  def frontendIp_configurations
    @frontendIp_configurations ||= @properties['frontendIPConfigurations']
  end

  def backendend_address_pools
    @backendend_address_pools ||= @properties['backendAddressPools']
  end

  def probes
    @probes ||= @properties['probes']
  end

  def inbound_nat_rules
    @inbound_nat_rules ||= @properties['inboundNatRules']
  end

  def inbound_nat_pools
    @inbound_nat_pools ||= @properties['inboundNatPools']
  end


  def to_s
    "Azure Load Balancer: '#{name}'"
  end
end
