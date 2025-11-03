# App Auth Strategy
resource "konnect_application_auth_strategy" "apikey" {
    key_auth = {
        configs = {
            key_auth = {
                key_names = [
                    "apikey"
                ]
            }
        }
        display_name  = "${var.dev_portal_auth_strategy_display_name}"
        name          = "${var.dev_portal_auth_strategy_name}"
        strategy_type = "key_auth"
    }
}

# Create Dev Portal
resource "konnect_portal" "workshop_portal" {
    name                                 = "${var.dev_portal_name}"
    authentication_enabled               = true
    auto_approve_applications            = true
    auto_approve_developers              = true
    rbac_enabled                         = true
    default_api_visibility               = "private"
    default_application_auth_strategy_id = "${konnect_application_auth_strategy.apikey.id}"
    default_page_visibility              = "private"
    description                          = "${var.dev_portal_desc_prefix} ${var.workshop_customer_name} ${var.dev_portal_desc_suffix}"
    display_name                         = "${var.dev_portal_display_name}"
    force_destroy                        = "true"
}

# Customization of Portal
## Logo
resource "konnect_portal_logo" "workshop_portal_logo" {
    data = "data:image/${var.dev_portal_logo_file_type};base64,${filebase64(var.dev_portal_logo_path)}"
    portal_id = "${konnect_portal.workshop_portal.id}"
}

# Create Snippets
resource "konnect_portal_snippet" "code_block_graphix" {
    name        = "code-block-graphix"
    content     = "${file(var.dev_portal_snippet_code_block_graphix_path)}"
    description = "A header/footer graphic than can be re-used on multiple pages."
    title       = "code-block-graphix"
    status      = "published"
    visibility  = "public"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

# Create pages
resource "konnect_portal_page" "student-apis" {
    content     = "${file(var.dev_portal_page_student_apis_path)}"
    description = "A page for showcasing the workshop student's published APIs"
    title       = "student-apis"
    status      = "published"
    visibility  = "private"
    slug        = "/student-apis"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

resource "konnect_portal_page" "getting-started" {
    content     = "${file(var.dev_portal_page_getting_started_path)}"
    description = "Get started with our Developer Portal!"
    title       = "getting-started"
    status      = "published"
    visibility  = "public"
    slug        = "/getting-started"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

resource "konnect_portal_page" "home" {
    content     = templatefile(var.dev_portal_page_home_path, {
        workshop_customer_name                            = var.workshop_customer_name
        dev_portal_page_content_home_page_hero_bg_img_url = var.dev_portal_page_content_home_page_hero_bg_img_url
        dev_portal_page_content_home_page_hero_text_color = var.dev_portal_page_content_home_page_hero_text_color
        dev_portal_page_content_home_page_hero_img_width  = var.dev_portal_page_content_home_page_hero_img_width
    })
    description = "Start building and innovating with our APIs"
    title       = "home"
    status      = "published"
    visibility  = "public"
    slug        = "/"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

resource "konnect_portal_page" "apis" {
    content     = "${file(var.dev_portal_page_apis_path)}"
    description = "Explore a wide range of API products in our Developer Portal designed for fast, flexible development."
    title       = "apis"
    status      = "published"
    visibility  = "private"
    slug        = "/apis"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

# Create Customizations
resource "konnect_portal_customization" "workshop_portal" {
    menu        = {
        main = [
            {
                external   = false
                path       = "/"
                title      = "Home"
                visibility = "public"
            },
            {
                external   = false
                path       = "/getting-started"
                title      = "Getting Started"
                visibility = "public"
            },
            {
                external   = false
                path       = "/apis"
                title      = "API Catalog"
                visibility = "private"
            },
            {
                external   = false
                path       = "/student-apis"
                title      = "Student APIs"
                visibility = "private"
            }
        ]
        footer_bottom = []
        footer_sections = [
            {
                title = "Products"
                items = [
                    {
                        external = false
                        path     = "#"
                        title    = "Pricing"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "/apis"
                        title    = "APIs"
                        visibility = "private"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Documentation"
                        visibility = "public"
                    }
                ]
            },
            {
                title = "Company"
                items = [
                    {
                        external = false
                        path     = "#"
                        title    = "About"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Careers"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Press"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Events"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Investors"
                        visibility = "public"
                    }
                ]
            },
            {
                title = "Legal"
                items = [
                    {
                        external = false
                        path     = "#"
                        title    = "Terms and conditions"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Data privacy"
                        visibility = "public"
                    },
                    {
                        external = false
                        path     = "#"
                        title    = "Trust and compliance"
                        visibility = "public"
                    }
                ]
            }
        ]
    }
    theme       = {
        colors = {
            primary = "${var.dev_portal_brand_color}"
        }
        mode = "${var.dev_portal_color_mode}"
    }
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

# Create Teams
## Internal APIs
resource "konnect_portal_team" "internal-apis" {
    description = "Internal developers allowed to view all APIs in the catalog."
    name        = "Internal APIs"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

## Student APIs
resource "konnect_portal_team" "student-apis" {
    description = "Workshop Student developers allowed to view only the Student published APIs."
    name        = "Student APIs"
    portal_id   = "${konnect_portal.workshop_portal.id}"
}

# Assign SSO Users to Teams
## As of 8/26/2025 - Not possible yet with Terraform modules
resource "null_resource" "dev_portal_idp_team_mappings" {
    provisioner "local-exec" {
        command = <<EOT
            curl --request PATCH \
              --url "${var.konnect_api_url}/v3/portals/${konnect_portal.workshop_portal.id}/identity-provider/team-group-mappings" \
              --header 'Accept: application/json, application/problem+json' \
              --header "Authorization: Bearer ${var.konnect_token}" \
              --header 'Content-Type: application/json' \
              --data '{
                "data": [
                    {
                        "team_id": "${konnect_portal_team.internal-apis.id}",
                        "groups": [
                            "Analytics Admin",
                            "API Product Developer",
                            "API Product Admin"
                        ]
                    },
                    {
                        "team_id": "${konnect_portal_team.student-apis.id}",
                        "groups": [
                            "Custom User",
                            "Custom Admin",
                            "Custom Viewer",
                            "Organization Admin RO",
                            "Control Plane Admin",
                            "Portal Admin",
                            "Analytics Admin",
                            "API Product Developer",
                            "API Product Admin"
                        ]
                    }
                ]
            }'
          EOT
    }

    depends_on = [
        konnect_portal_team.internal-apis,
        konnect_portal_team.student-apis
    ]
}

## Internal-APIs Team Role assignment
resource "null_resource" "portal-team-internal-apis-role-all" {
    provisioner "local-exec" {
        command = <<EOT
            curl --request POST \
              --url "${var.konnect_api_url}/v3/portals/${konnect_portal.workshop_portal.id}/teams/${konnect_portal_team.internal-apis.id}/assigned-roles" \
              --header 'Accept: application/json, application/problem+json' \
              --header "Authorization: Bearer ${var.konnect_token}" \
              --header 'Content-Type: application/json' \
              --data '{
                "role_name": "API Consumer",
                "entity_id": "*",
                "entity_type_name": "Services",
                "entity_region": "us"
            }'
          EOT
    }

    depends_on = [
        konnect_portal_team.internal-apis
    ]
}