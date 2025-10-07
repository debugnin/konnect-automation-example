resource "konnect_gateway_control_plane" "nab-cp-1" {
  name          = "NAB Control Plane 1"
  cluster_type  = "CLUSTER_TYPE_CONTROL_PLANE"
  description   = "NAB Control plane"
  auth_type     = "pinned_client_certs"
  proxy_urls    = []
}

resource "konnect_gateway_control_plane" "nab-cp-2" {
  name          = "NAB Control Plane 2"
  cluster_type  = "CLUSTER_TYPE_CONTROL_PLANE"
  description   = "NAB Control plane"
  auth_type     = "pinned_client_certs"
  proxy_urls    = []
}

resource "konnect_gateway_control_plane" "nab-cp-group" {
  name         = "NAB Control Plane Group v2"
  description  = "This is a sample description"
  cluster_type = "CLUSTER_TYPE_CONTROL_PLANE_GROUP"
  auth_type    = "pinned_client_certs"

  proxy_urls = []
}

resource "konnect_gateway_control_plane_membership" "nab-cp-group-membership" {
  id = konnect_gateway_control_plane.nab-cp-group.id
  members = [
    { id = konnect_gateway_control_plane.nab-cp-2.id },
    { id = konnect_gateway_control_plane.nab-cp-1.id },
  ]
}

resource "konnect_gateway_control_plane" "cba-cp-1" {
  name          = "CBA Control Plane 1"
  cluster_type  = "CLUSTER_TYPE_CONTROL_PLANE"
  description   = "CBA Control plane"
  auth_type     = "pinned_client_certs"
  proxy_urls    = []
}

resource "konnect_gateway_control_plane" "cba-cp-2" {
  name          = "CBA Control Plane 2"
  cluster_type  = "CLUSTER_TYPE_CONTROL_PLANE"
  description   = "CBA Control plane"
  auth_type     = "pinned_client_certs"
  proxy_urls    = []
}

resource "konnect_gateway_control_plane" "cba-cp-group" {
  name         = "CBA Control Plane Group"
  description  = "This is a sample description"
  cluster_type = "CLUSTER_TYPE_CONTROL_PLANE_GROUP"
  auth_type    = "pinned_client_certs"

  proxy_urls = []
}

resource "konnect_gateway_control_plane_membership" "cba-cp-group-membership" {
  id = konnect_gateway_control_plane.cba-cp-group.id
  members = [
    { id = konnect_gateway_control_plane.cba-cp-2.id },
    { id = konnect_gateway_control_plane.cba-cp-1.id },
  ]
}


resource "konnect_gateway_control_plane" "anz-cp-1" {
  name          = "ANZ Control Plane 1"
  cluster_type  = "CLUSTER_TYPE_CONTROL_PLANE"
  description   = "ANZ Control plane"
  auth_type     = "pinned_client_certs"
  proxy_urls    = []
}

resource "konnect_gateway_control_plane" "anz-cp-2" {
  name          = "ANZ Control Plane 2"
  cluster_type  = "CLUSTER_TYPE_CONTROL_PLANE"
  description   = "ANZ Control plane"
  auth_type     = "pinned_client_certs"
  proxy_urls    = []
}

resource "konnect_gateway_control_plane" "anz-cp-group" {
  name         = "ANZ Control Plane Group"
  description  = "This is a sample description"
  cluster_type = "CLUSTER_TYPE_CONTROL_PLANE_GROUP"
  auth_type    = "pinned_client_certs"

  proxy_urls = []
}

resource "konnect_gateway_control_plane_membership" "anz-cp-group-membership" {
  id = konnect_gateway_control_plane.anz-cp-group.id
  members = [
    { id = konnect_gateway_control_plane.anz-cp-2.id },
    { id = konnect_gateway_control_plane.anz-cp-1.id },
  ]
}