class DishRecognizer
  def initialize(recognizer = IBMRecognitionService.new)
    @recognizer ||= recognizer
  end

  def classify(url)
    @recognizer.classify({url: url})
  end

  def get_max_by_score(dishes)
    max_score = dishes.pluck(:score).max
    dishes.find{ |dish| dish[:score] === max_score}
  end
end
