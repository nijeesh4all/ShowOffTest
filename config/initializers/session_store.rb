
Showoff::Application.config.session_store :cookie_store, key: Rails.application.credentials.secret_key_base,
                                        secure: Rails.env.production?