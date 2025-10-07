# Konnect Terraform Configuration

This directory contains Terraform configuration for managing Kong Konnect resources including control planes, data plane certificates, and service configurations for multiple customers (NAB, CBA, and ANZ).

## Prerequisites

- Terraform installed (>= 1.0)
- Kong Konnect account with API access
- Personal Access Token for Konnect API

## Setup

1. **Set Konnect Token**:
   ```bash
   export TF_VAR_konnect_token="your-konnect-token"
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

## Resources Created

### Control Planes
- **NAB**: Control planes and control plane group for NAB customer
- **CBA**: Control planes and control plane group for CBA customer
- **ANZ**: Can be added following the same pattern

### Certificates
- CA certificate for signing client certificates
- Client certificates for each customer's data planes
- Data plane client certificates registered in Konnect

### Service Configuration
- Sample HTTPBin service and route
- Key authentication plugin
- Consumer and consumer groups

## File Structure

```
├── auth.tf                 # Provider configuration
├── control-planes.tf       # Control plane resources
├── data-plane-cert.tf      # Data plane certificates
├── data-sources.tf         # Data sources for existing resources
├── output.tf              # Output values
├── service-config.tf       # Sample service configuration
├── system-accounts.tf      # System accounts and tokens
├── variables.tf           # Variable definitions
└── cert/                  # Certificate directory (gitignored)
    ├── ca.crt
    ├── ca.key
    ├── nab-client.crt
    ├── nab-client.key
    ├── cba-client.crt
    ├── cba-client.key
    ├── anz-client.crt
    └── anz-client.key
```

## Usage

### Deploy Infrastructure
```bash
# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

### Generate Client Certificates
```bash
# Generate CA certificate (if not exists)
openssl req -x509 -newkey rsa:2048 -days 3650 \
  -nodes -keyout cert/ca.key -out cert/ca.crt -subj "/CN=Test-CA"

# Generate client certificates for each customer
./scripts/generate-client-cert.sh nab
./scripts/generate-client-cert.sh cba
./scripts/generate-client-cert.sh anz
```

### Add New Customer
1. Add control plane resources in `control-planes.tf`
2. Add data plane certificate in `data-plane-cert.tf`
3. Generate client certificate
4. Update outputs if needed

## Outputs

- `nab_cp_group_info`: NAB control plane group information
- `cba_cp_group_info`: CBA control plane group information
- Control plane IDs for data plane configuration

## Security Notes

- Certificate files are gitignored for security
- Use environment variables for sensitive values
- Rotate certificates regularly
- Store certificates securely in production

## Troubleshooting

### Certificate Issues
```bash
# Verify certificate
openssl x509 -in cert/nab-client.crt -text -noout

# Check certificate validity
openssl verify -CAfile cert/ca.crt cert/nab-client.crt
```

### Terraform State Issues
```bash
# Import existing resources
terraform import konnect_gateway_control_plane.nab-cp-1 <control-plane-id>

# Refresh state
terraform refresh
```

## Integration with GitOps

The certificates generated here are used by:
- Kong data planes deployed via ArgoCD
- HashiCorp Vault for certificate storage
- Kubernetes secrets for data plane authentication

See `../kong-dataplane-gitops/` for the complete GitOps setup.