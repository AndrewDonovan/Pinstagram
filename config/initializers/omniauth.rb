Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, 'a8ad5a7fb86744b19ebc17cf600793c7', 'a3980ec37477470c8b5e38f92bb40b35'
end