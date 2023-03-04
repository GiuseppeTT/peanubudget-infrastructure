resource "azurerm_resource_group" "this" {
  name     = "${var.prefix}-resource-group"
  location = var.location
}

resource "random_string" "this" {
  length  = 32
  lower   = true
  numeric = true
  special = false
  upper   = true
}

resource "random_password" "this" {
  length           = 32
  lower            = true
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
  min_upper        = 1
  numeric          = true
  override_special = "_" # Make compatible with bash and PostgreSQL URL
  special          = true
  upper            = true
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "${var.prefix}-postgresql-flexible-server"
  resource_group_name    = azurerm_resource_group.this.name
  location               = azurerm_resource_group.this.location
  administrator_login    = random_string.this.result
  administrator_password = random_password.this.result
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  version                = "14"
  zone                   = "1"
}

resource "azurerm_postgresql_flexible_server_database" "prod" {
  name      = "prod"
  server_id = azurerm_postgresql_flexible_server.this.id
}

resource "azurerm_postgresql_flexible_server_database" "test" {
  name      = "test"
  server_id = azurerm_postgresql_flexible_server.this.id
}

# Equivalent to "Allow access to Azure services"
# TODO: Replace this with a virtual network
resource "azurerm_postgresql_flexible_server_firewall_rule" "this" {
  name             = "${var.prefix}-postgresql-flexible-server-firewall-rule"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_container_registry" "this" {
  name                = replace("${var.prefix}-container-registry", "-", "")
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = "${var.prefix}-kubernetes-cluster"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = var.prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "this" {
  principal_id                     = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.this.id
  skip_service_principal_aad_check = true
}

resource "azurerm_public_ip" "this" {
  name                = "${var.prefix}-public-ip-address-kubernetes-load-balancer"
  resource_group_name = azurerm_kubernetes_cluster.this.node_resource_group
  location            = azurerm_resource_group.this.location
  allocation_method   = "Static"
  domain_name_label   = var.prefix
  sku                 = "Standard"
}
