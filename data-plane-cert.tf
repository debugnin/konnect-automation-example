resource "konnect_gateway_data_plane_client_certificate" "nab-cp-group-cert" {
  cert = file("./cert/ca.crt")
  control_plane_id = konnect_gateway_control_plane.nab-cp-group.id
}

resource "konnect_gateway_data_plane_client_certificate" "cba-cp-group-cert" {
  cert = file("./cert/ca.crt")
  control_plane_id = konnect_gateway_control_plane.cba-cp-group.id
}

resource "konnect_gateway_data_plane_client_certificate" "anz-cp-group-cert" {
  cert = file("./cert/ca.crt")
  control_plane_id = konnect_gateway_control_plane.anz-cp-group.id
}
