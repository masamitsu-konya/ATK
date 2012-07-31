require 'omniauth-openid'
require 'openid/fetchers'
require 'openid/store/filesystem'

OpenID.fetcher.ca_file = "/usr/lib/ssl/certs/ca-certificates.crt"

Rails.application.config.middleware.use OmniAuth::Builder do

  provider :twitter, 'm06VsF1kPVIZKgqC7pRwmg', 'yOVCRYGp3CBy4Wb27lyF0LR7p8po26pwwES45adM'
  provider :facebook, '334512816637562', 'f6cf73714700b7f7c3a6883d74f0eb90', {:scope => "read_friendlists"}
  #generic openID
  provider :github, '32e56c163a83372dc6e2', '48b22f1fc1f662faef55e8b77de556c0f2c5002c'
end
