class IBMAuthenticatorService
  include IBMWatson

  def self.authenticate
    Authenticators::IamAuthenticator.new(apikey: ENV['IBM_API_KEY'])
  end
end
