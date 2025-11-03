variable "dev_portal_name" {
    description = "The name of the Dev Portal in Konnect. The automation uses a combo of 'workshop_customer_name' and this variable to name the portal: '<workshop_customer_name> - <dev_portal_name>'.  Example: 'Konnect - Workshop Portal'"
    type        = string
    default     = "Workshop Portal"
}

variable "dev_portal_display_name" {
    description = "The name of the Dev Portal displayed within the Dev Portal application"
    type        = string
    default     = "Developer Portal"
}

variable "dev_portal_desc_prefix" {
    description = "Used to assemble the Dev Portal description based on '<dev_portal_desc_prefix><workshop_customer_name><dev_portal_desc_suffix'."
    type        = string
    default     = "Developer Portal deployed for"
}

variable "dev_portal_desc_suffix" {
    description = "Used to assemble the Dev Portal description based on '<dev_portal_desc_prefix><workshop_customer_name><dev_portal_desc_suffix'."
    type        = string
    default     = "Workshop use-cases."
}
variable "dev_portal_auth_strategy_display_name" {
    description = "The display name of the Dev Portal authentication strategy seen within the Dev Portal application"
    type        = string
    default     = "API Key"
}

variable "dev_portal_auth_strategy_name" {
    description = "The name of the Dev Portal authentication strategy seen within Konnect"
    type        = string
    default     = "Workshop Key Authentication"
}

variable "dev_portal_logo_path" {
    description = "The path to the logo you wish to use for your Dev Portal."
    type        = string
    default     = "logo.png"
}

variable "dev_portal_logo_file_type" {
    description = "The type of file the logo is.  Must be one of 'png','svg','jpeg','gif'."
    type        = string
    default     = "png"
}

# Portal Colors
variable "dev_portal_brand_color" {
    description = "The brand color code to use as the primary color scheme in the portal"
    type        = string
    default     = "#8250FF"
}

variable "dev_portal_color_mode" {
    description = "The color mode to use for the Dev Portal.  Must be one of 'light', 'dark', or 'system'."
    type        = string
    default     = "light"
}

# Snippets
variable "dev_portal_snippet_code_block_graphix_path" {
    description = "The path to the code-block-graphix Dev Portal snippet content"
    type        = string
    default     = "./dev-portal/snippets/code-block-graphix.md"
}

# Pages
variable "dev_portal_page_student_apis_path" {
    description = "The path to the student-apis Dev Portal page content"
    type        = string
    default     = "./dev-portal/pages/student-apis.md"
}

variable "dev_portal_page_getting_started_path" {
    description = "The path to the 'getting-started.md' Dev Portal page content"
    type        = string
    default     = "./dev-portal/pages/getting-started.md"
}

# Sample API Variables/Customizations
variable "dev_portal_page_home_path" {
    description = "The path to the 'home.md' Dev Portal page content"
    type        = string
    default     = "./dev-portal/pages/home.md"
}

variable "dev_portal_page_content_home_page_hero_bg_img_url" {
    description = "The URL path to a background image for the home page content"
    type        = string
    default     = "https://github.com/jharmn/img-bucket/blob/main/images/travel.png?raw=true"
}

variable "dev_portal_page_content_home_page_hero_text_color" {
    description = "Text color code of the home page's page hero section."
    type        = string
    default     = "#000000"
}

variable "dev_portal_page_content_home_page_hero_img_width" {
    description = "The background image width in '%' for the home page's page hero section."
    type        = string
    default     = "55%"
}

variable "dev_portal_page_apis_path" {
    description = "The path to the 'apis.md' Dev Portal page content"
    type        = string
    default     = "./dev-portal/pages/apis.md"
}


# Sample APIs
variable "dev_portal_sample_blog_api_spec_path" {
    description = "The path to the blog API Open API Specification for loading sample APIs into the Dev Portal."
    type        = string
    default     = "./api-specs/blog.yaml"
}

variable "dev_portal_sample_bankong_api_spec_path" {
    description = "The path to the 'Transactions API of BanKong' API Open API Specification for loading sample APIs into the Dev Portal."
    type        = string
    default     = "./api-specs/bankong.yaml"
}

variable "dev_portal_sample_bankong_api_doc_introduction_path" {
    description = "The path to the 'Transactions API of BanKong' API document titled 'Introduction' - path"
    type        = string
    default     = "./api-docs/bankong/Introduction.md"
}

variable "dev_portal_sample_bankong_api_doc_2nd_topic_path" {
    description = "The path to the 'Transactions API of BanKong' API document titled '2nd-topic' - path"
    type        = string
    default     = "./api-docs/bankong/2nd-topic.md"
}

variable "dev_portal_sample_blog_api_doc_introduction_path" {
    description = "The path to the 'Blog API' API document titled 'Introduction' - path"
    type        = string
    default     = "./api-docs/blog/Introduction.md"
}