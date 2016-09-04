class TextInspectionsController < ApplicationController
  def new

  end

  def create
    @text = params[:text_inspection][:user_text]
    @words = @text.split(' ')
    @word_count = @words.length
    @estimate_reading_time = (@word_count / 275) * 60
    @word_frequency = (word_frequency @words).sort_by { |key, value| -value }.first 10
    render 'results'
  end

  private

  def word_frequency words
    words.reduce(Hash.new(0)) { |words, word| words[word] += 1; words }
  end
end
