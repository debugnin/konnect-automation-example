# Sample APIs -> Create GW Svc in sample CP
## BanKong API
resource "konnect_gateway_service" "bankong_svc" {
    name             = "transactions-api-of-bankong"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    host             = "shared-services-hybrid.kong-sales-engineering.com"
    protocol         = "https"
    path             = "/"
    port             = "443"
    connect_timeout  = "6000"
    read_timeout     = "6000"
    write_timeout    = "6000"
    retries          = "5"
    enabled          = "true"
    tags             = [
        "transactions-api-of-bankong",
        "dev-portal-sample"
    ]
}

## Blog API
resource "konnect_gateway_service" "blog_svc" {
    name             = "blog"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    host             = "httpbin.konghq.com"
    protocol         = "https"
    path             = "/anything"
    port             = "443"
    connect_timeout  = "6000"
    read_timeout     = "6000"
    write_timeout    = "6000"
    retries          = "5"
    enabled          = "true"
    tags = [
        "blog-api",
        "dev-portal-sample"
    ]
}

# Sample API -> Create routes in sample CP
## BanKong API
resource "konnect_gateway_route" "bankong_cancel" {
    name = "transactions-api-of-bankong_canceltransaction"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.bankong_svc.id}"
    }

    methods = [
        "DELETE"
    ]

    paths = [
        "~/transactions/(?<id>[^#?/]+)$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"

    tags             = [
        "transactions-api-of-bankong",
        "dev-portal-sample"
    ]
}

resource "konnect_gateway_route" "bankong_initiate" {
    name = "transactions-api-of-bankong_initiatetransaction"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.bankong_svc.id}"
    }

    methods = [
        "POST"
    ]

    paths = [
        "~/transactions$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"

    tags             = [
        "transactions-api-of-bankong",
        "dev-portal-sample"
    ]
}

resource "konnect_gateway_route" "bankong_get" {
    name = "transactions-api-of-bankong_gettransaction"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.bankong_svc.id}"
    }

    methods = [
        "GET"
    ]

    paths = [
        "~/transactions/(?<id>[^#?/]+)$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"
    tags             = [
        "transactions-api-of-bankong",
        "dev-portal-sample"
    ]
}

resource "konnect_gateway_route" "bankong_list" {
    name = "transactions-api-of-bankong_listtransactions"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.bankong_svc.id}"
    }

    methods = [
        "GET"
    ]

    paths = [
        "~/transactions$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"
    tags             = [
        "transactions-api-of-bankong",
        "dev-portal-sample"
    ]
}

## Blog API
resource "konnect_gateway_route" "blog_add" {
    name = "blog_addblog"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.blog_svc.id}"
    }

    methods = [
        "POST"
    ]

    paths = [
        "~/blogs$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"
    tags             = [
        "blog-api",
        "dev-portal-sample"
    ]
}

resource "konnect_gateway_route" "blog_get" {
    name = "blog_getblogbyid"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.blog_svc.id}"
    }

    methods = [
        "GET"
    ]

    paths = [
        "~/blogs/(?<id>[^#?/]+)$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"
    tags             = [
        "blog-api",
        "dev-portal-sample"
    ]
}

resource "konnect_gateway_route" "blog_options" {
    name = "blog_blogs_options"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.blog_svc.id}"
    }

    methods = [
        "OPTIONS"
    ]

    paths = [
        "~/blogs$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"
    tags             = [
        "blog-api",
        "dev-portal-sample"
    ]
}

resource "konnect_gateway_route" "blog_list" {
    name = "blog_getblogs"
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"

    service = {
        id = "${konnect_gateway_service.blog_svc.id}"
    }

    methods = [
        "GET"
    ]

    paths = [
        "~/blogs$"
    ]
    path_handling = "v0"
    preserve_host = "false"

    protocols = [
        "http",
        "https"
    ]

    regex_priority     = "100"
    request_buffering  = "true"
    response_buffering = "true"
    strip_path         = "false"
    tags             = [
        "blog-api",
        "dev-portal-sample"
    ]
}

# Sample APIs -> Create req'd plugins in sample CP
## BanKong API
### BanKong openid-connect
resource "konnect_gateway_plugin_openid_connect" "bankong_svc_oidc" {
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    instance_name = "transactions-api-of-bankong-svc-oidc"
    service = {
        id = "${konnect_gateway_service.bankong_svc.id}"
    }
    config = {
        audience_claim = [
            "aud"
        ]
        auth_methods = [
            "client_credentials",
            "session"
        ]
        authorization_cookie_http_only = true
        authorization_cookie_name = "authorization"
        authorization_cookie_path = "/"
        authorization_cookie_same_site = "Default"
        authorization_rolling_timeout = 600
        bearer_token_param_type = [
            "header",
            "query",
            "body"
        ]
        by_username_ignore_case = false
        cache_introspection = true
        cache_token_exchange = true
        cache_tokens = true
        cache_tokens_salt = "Q9FdBQTxLENC4sboNBP7slfCVGfOSd7A"
        cache_ttl = 3600
        cache_user_info = true
        client_arg = "client_id"
        client_credentials_param_type = [
            "header",
            "query",
            "body"
        ]
        cluster_cache_redis = {
        cluster_max_redirections = 5
        connect_timeout = 2000
        connection_is_proxied = false
        database = 0
        host = "127.0.0.1"
        keepalive_pool_size = 256
        port = 6379
        read_timeout = 2000
        send_timeout = 2000
        ssl = false
        ssl_verify = false
        timeout = 2000
        }
        cluster_cache_strategy = "off"
        consumer_by = [
            "username",
            "custom_id"
        ]
        consumer_optional = false
        credential_claim = [
            "sub"
        ]
        display_errors = false
        dpop_proof_lifetime = 300
        dpop_use_nonce = false
        enable_hs_signatures = false
        expose_error_code = true
        forbidden_destroy_session = true
        forbidden_error_message = "Forbidden"
        groups_claim = [
            "groups"
        ]
        hide_credentials = false
        http_version = 1.1
        id_token_param_type = [
            "header",
            "query",
            "body"
        ]
        ignore_signature = []
        introspect_jwt_tokens = false
        introspection_accept = "application/json"
        introspection_check_active = true
        introspection_hint = "access_token"
        introspection_token_param_name = "token"
        issuer = "https://kong-sandbox.oktapreview.com/oauth2/default"
        jwt_session_claim = "sid"
        keepalive = true
        leeway = 0
        login_action = "upstream"
        login_methods = [
            "authorization_code"
        ]
        login_redirect_mode = "fragment"
        login_tokens = [
            "id_token"
        ]
        logout_methods = [
            "POST",
            "DELETE"
        ]
        logout_revoke = false
        logout_revoke_access_token = true
        logout_revoke_refresh_token = true
        password_param_type = [
            "header",
            "query",
            "body"
        ]
        preserve_query_args = false
        proof_of_possession_auth_methods_validation = true
        proof_of_possession_dpop = "off"
        proof_of_possession_mtls = "off"
        redis = {
        cluster_max_redirections = 5
        connect_timeout = 2000
        connection_is_proxied = false
        database = 0
        host = "127.0.0.1"
        keepalive_pool_size = 256
        port = 6379
        read_timeout = 2000
        send_timeout = 2000
        ssl = false
        ssl_verify = false
        timeout = 2000
        }
        rediscovery_lifetime = 30
        refresh_token_param_type = [
            "header",
            "query",
            "body"
        ]
        refresh_tokens = true
        resolve_distributed_claims = false
        response_mode = "query"
        response_type = [
            "code"
        ]
        reverify = false
        revocation_token_param_name = "token"
        roles_claim = [
            "roles"
        ]
        run_on_preflight = true
        scopes = [
            "se_scope"
        ]
        scopes_claim = [
            "scope"
        ]
        search_user_info = false
        session_absolute_timeout = 86400
        session_audience = "default"
        session_compressor = "none"
        session_cookie_http_only = true
        session_cookie_maxsize = 4000
        session_cookie_name = "session"
        session_cookie_path = "/"
        session_cookie_renew = 600
        session_cookie_same_site = "Lax"
        session_enforce_same_subject = false
        session_hash_storage_key = false
        session_hash_subject = false
        session_idling_timeout = 900
        session_memcached_host = "127.0.0.1"
        session_memcached_port = 11211
        session_redis_cluster_max_redirections = 5
        session_redis_connect_timeout = 2000
        session_redis_host = "127.0.0.1"
        session_redis_port = 6379
        session_redis_read_timeout = 2000
        session_redis_send_timeout = 2000
        session_redis_ssl = false
        session_redis_ssl_verify = false
        session_remember = false
        session_remember_absolute_timeout = 2592000
        session_remember_cookie_name = "remember"
        session_remember_rolling_timeout = 604800
        session_rolling_timeout = 3600
        session_storage = "cookie"
        session_store_metadata = false
        session_strategy = "default"
        ssl_verify = false
        timeout = 10000
        tls_client_auth_ssl_verify = true
        token_cache_key_include_scope = false
        unauthorized_destroy_session = true
        unauthorized_error_message = "Unauthorized"
        upstream_access_token_header = "authorization:bearer"
        userinfo_accept = "application/json"
        using_pseudo_issuer = false
        verify_claims = true
        verify_nonce = true
        verify_parameters = false
        verify_signature = true
    }
    enabled = true

    protocols = [
        "grpc",
        "grpcs",
        "http",
        "https"
    ]

    tags = [
        "transactions-api-of-bankong",
        "dev-portal-sample"
    ]
}

## Blog API
### Blog CORS Plugin
resource "konnect_gateway_plugin_cors" "blog_svc_cors" {
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    instance_name = "blog-service-cors"

    service = {
        id = "${konnect_gateway_service.blog_svc.id}"
    }

    config = {
        allow_origin_absent = true
        credentials = true
        headers = []
        methods = [
            "GET",
            "HEAD",
            "PUT",
            "PATCH",
            "POST",
            "DELETE",
            "OPTIONS",
            "TRACE",
            "CONNECT"
        ]
        origins = []
        preflight_continue = false
        private_network = false
    }
    enabled = true

    protocols = [
        "grpc",
        "grpcs",
        "http",
        "https"
    ]

    tags = [
        "blog-api",
        "dev-portal-sample"
    ]
}

### Blog rate-limiting-advanced
resource "konnect_gateway_plugin_rate_limiting_advanced" "blog_svc_rl_advanced" {
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    instance_name = "blog-service-rl-advanced"

    service = {
        id = "${konnect_gateway_service.blog_svc.id}"
    }

    config = {
        dictionary_name = "kong_rate_limiting_counters"
        disable_penalty = false
        enforce_consumer_groups = false
        error_code = 429
        error_message = "API rate limit exceeded"
        hide_client_headers = false
        identifier = "ip"
        limit = [
            50
        ]
        lock_dictionary_name = "kong_locks"
        namespace = "random_auto_generated_string"
        redis = {
        cluster_max_redirections = 5
        connect_timeout = 2000
        connection_is_proxied = false
        database = 0
        host = "127.0.0.1"
        keepalive_pool_size = 256
        port = 6379
        read_timeout = 2000
        send_timeout = 2000
        ssl = false
        ssl_verify = false
        timeout = 2000
        }
        retry_after_jitter_max = 0
        strategy = "local"
        sync_rate = -1
        window_size = [
            30
        ]
        window_type = "sliding"
    }

    enabled = true
    protocols = [
        "grpc",
        "grpcs",
        "http",
        "https"
    ]

    tags = [
        "blog-api",
        "dev-portal-sample"
    ]
}

### Blog Mocking Plugins
resource "konnect_gateway_plugin_mocking" "blog_route_addblog_mocking" {
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    instance_name = "blog-route-add-blog-mocking"

    route = {
      id = "${konnect_gateway_route.blog_add.id}"
    }

    config = {
        api_specification = "${file(var.dev_portal_sample_blog_api_spec_path)}"
        include_base_path = false
        max_delay_time = 1
        min_delay_time = 0.001
        random_delay = false
        random_examples = false
        random_status_code = false
    }

    enabled = true
    protocols = [
        "grpc",
        "grpcs",
        "http",
        "https"
    ]

    tags = [
        "blog-api",
        "dev-portal-sample"
    ]
}


resource "konnect_gateway_plugin_mocking" "blog_route_blogs_mocking" {
    control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
    instance_name = "blog-route-get-blogs-mocking"

    route = {
      id = "${konnect_gateway_route.blog_list.id}"
    }

    config = {
        api_specification = "${file(var.dev_portal_sample_blog_api_spec_path)}"
        include_base_path = false
        max_delay_time = 1
        min_delay_time = 0.001
        random_delay = false
        random_examples = false
        random_status_code = false
    }

    enabled = true
    protocols = [
        "grpc",
        "grpcs",
        "http",
        "https"
    ]

    tags = [
        "blog-api",
        "dev-portal-sample"
    ]
}

# Sample APIs
## BanKong API
resource "konnect_api" "bankong" {
    name    = "Transactions API of BanKong"
    version = "1.0.6"
    spec_content = templatefile(var.dev_portal_sample_bankong_api_spec_path, {
        dev_portal_sample_baseurl = var.dev_portal_sample_baseurl
    })
    attributes   = jsonencode({domain = ["Internal"]})
}

## Blog API
resource "konnect_api" "blog" {
    name    = "Blog API"
    version = "1.0.0"
    spec_content = templatefile(var.dev_portal_sample_blog_api_spec_path, {
        dev_portal_sample_baseurl = var.dev_portal_sample_baseurl
    })
    attributes   = jsonencode({domain = ["Internal"]})
}

# Sample API docs
## BanKong API Documentation Pages
resource "konnect_api_document" "bankong_introduction" {
    api_id  = "${konnect_api.bankong.id}"
    content = "${file(var.dev_portal_sample_bankong_api_doc_introduction_path)}"
    slug    = "studentSAMPLE"
    status  = "published"
    title   = "Introduction"
}

resource "konnect_api_document" "bankong_2nd_topic" {
    api_id  = "${konnect_api.bankong.id}"
    content = "${file(var.dev_portal_sample_bankong_api_doc_2nd_topic_path)}"
    slug    = "2nd-topic-studentSAMPLE"
    status  = "published"
    title   = "2nd-topic"
    parent_document_id = "${konnect_api_document.bankong_introduction.id}"
}

## Blog API Documentation Pages
resource "konnect_api_document" "blog_introduction" {
    api_id  = "${konnect_api.blog.id}"
    content = "${file(var.dev_portal_sample_blog_api_doc_introduction_path)}"
    slug    = "studentSAMPLE"
    status  = "published"
    title   = "Introduction"
}


# Link Gateway Services to APIs
## BanKong API
resource "konnect_api_implementation" "bankong" {
    api_id = "${konnect_api.bankong.id}"
    service_reference = {
        service = {
            control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
            id               = "${konnect_gateway_service.bankong_svc.id}"
        }
    }
}

## Blog API
resource "konnect_api_implementation" "blog" {
    api_id = "${konnect_api.blog.id}"
    service_reference = {
        service = {
            control_plane_id = "${konnect_gateway_control_plane.dev_portal_sample.id}"
            id               = "${konnect_gateway_service.blog_svc.id}"
        }
    }
}

# Sample API Publishing
## BanKong API
resource "konnect_api_publication" "bankong_api_to_workshop_portal" {
    api_id    = "${konnect_api.bankong.id}"
    portal_id = "${konnect_portal.workshop_portal.id}"

    auth_strategy_ids = [
        "${konnect_application_auth_strategy.apikey.id}"
    ]

    auto_approve_registrations = true
    visibility                 = "private"
}

## Blog API
resource "konnect_api_publication" "blog_api_to_workshop_portal" {
    api_id    = "${konnect_api.blog.id}"
    portal_id = "${konnect_portal.workshop_portal.id}"

    auth_strategy_ids = [
        "${konnect_application_auth_strategy.apikey.id}"
    ]

    auto_approve_registrations = true
    visibility                 = "private"
}
