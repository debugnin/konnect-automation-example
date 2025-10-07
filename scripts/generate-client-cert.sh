#!/bin/bash

# Script to generate client certificates for Kong data planes
# Usage: ./generate-client-cert.sh <customer-name>

set -e

CUSTOMER=$1
CERT_DIR="cert"

if [ -z "$CUSTOMER" ]; then
    echo "Usage: $0 <customer-name>"
    echo "Example: $0 nab"
    exit 1
fi

# Create cert directory if it doesn't exist
mkdir -p $CERT_DIR

# Generate CA certificate if it doesn't exist
if [ ! -f "$CERT_DIR/ca.crt" ] || [ ! -f "$CERT_DIR/ca.key" ]; then
    echo "Generating CA certificate..."
    openssl req -x509 -newkey rsa:2048 -days 3650 \
        -nodes -keyout $CERT_DIR/ca.key -out $CERT_DIR/ca.crt \
        -subj "/CN=Test-CA"
    echo "CA certificate generated: $CERT_DIR/ca.crt"
fi

# Generate client certificate for the customer
echo "Generating client certificate for $CUSTOMER..."

# Generate private key and CSR
openssl req -newkey rsa:2048 -nodes -keyout $CERT_DIR/${CUSTOMER}-client.key \
    -out $CERT_DIR/${CUSTOMER}-client.csr -subj "/CN=${CUSTOMER}-client"

# Sign the certificate with CA
openssl x509 -req -in $CERT_DIR/${CUSTOMER}-client.csr -CA $CERT_DIR/ca.crt -CAkey $CERT_DIR/ca.key \
    -CAcreateserial -out $CERT_DIR/${CUSTOMER}-client.crt -days 3650

# Clean up CSR file
rm $CERT_DIR/${CUSTOMER}-client.csr

# Verify the certificate
echo "Verifying certificate..."
openssl verify -CAfile $CERT_DIR/ca.crt $CERT_DIR/${CUSTOMER}-client.crt

echo "Client certificate generated successfully:"
echo "  Certificate: $CERT_DIR/${CUSTOMER}-client.crt"
echo "  Private Key: $CERT_DIR/${CUSTOMER}-client.key"

# Display certificate info
echo ""
echo "Certificate details:"
openssl x509 -in $CERT_DIR/${CUSTOMER}-client.crt -noout -subject -issuer -dates

# Optional: Store in Vault if kubectl and vault are available
if command -v kubectl &> /dev/null; then
    echo ""
    read -p "Store certificate in HashiCorp Vault? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Storing certificate in Vault..."
        kubectl exec -it vault-0 -n vault -- vault kv put secret/tls/${CUSTOMER} \
            cert="$(cat $CERT_DIR/${CUSTOMER}-client.crt)" \
            key="$(cat $CERT_DIR/${CUSTOMER}-client.key)" || echo "Failed to store in Vault"
    fi
fi

echo "Done!"