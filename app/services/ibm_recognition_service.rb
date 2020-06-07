class IBMRecognitionService
  include IBMWatson

  VERSION = "2018-03-19".freeze

  def initialize
    @recognizer = VisualRecognitionV3.new(
      version: VERSION,
      authenticator: IBMAuthenticatorService.authenticate
    )
    @recognizer.service_url = ENV["IBM_URL"]
  end


  def classify(params, classifier_ids=["food"])
    @recognizer.classify({
      classifier_ids: classifier_ids,
      url: params[:url]
    }).result if params[:url].present?
  end
end
