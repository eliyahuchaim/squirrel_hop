class ScoreCalculator

  attr_reader :response, :max_keyword, :ideal_title_char, :ideal_desc_char

  def initialize(response)
    @response = response
    @max_keyword = 10
    @ideal_desc_char = 500
    @idea_title_char = 100
  end

  def self.weights
    {vendor: 3, keyword: 2.5, quote: 2.5, desc: 1, title: 1}
  end

  def keyword_score
    #get posts category
    keyword = self.response.post.service.name
    keyword_match_score = self.response.description.scan(/#{keyword}/).count
    1.0 * [@max_keyword, keyword_match_score].min / @max_keyword
  end

  def quote_score
    min_price = self.response.post.min_price
    max_price = self.response.post.max_price
    current_price = self.response.price_quote
    1.0 * (max_price - current_price) / (max_price - min_price)
  end

  def description_count_score
    current_char = self.response.description.length
    if current_char >= @ideal_desc_char
      1.0 * ([current_char, @ideal_desc_char * 2].max - current_char) / @ideal_desc_char
    else
      1.0 * (@ideal_desc_char - current_char) / @ideal_desc_char
    end
  end

  def title_count_score
    return 0 if self.response.title.nil?
    current_char = self.response.title.length
    if current_char >= @ideal_title_char
      1.0 * ([current_char, @ideal_title_char * 1.5].max - current_char) / @ideal_title_char
    else
      1.0 * (@ideal_title_char - current_char) / @ideal_title_char
    end
  end


end
