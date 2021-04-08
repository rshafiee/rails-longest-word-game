require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(26) { ('A'.. 'Z').to_a.sample }
    @letters.join('')
  end

  def score
    @word = params[:word]
    if english_word?(@word)
      @answer = "well done, #{@word.capitalize} is a right English word!"
    else
      @answer = "Sorry, #{@word.capitalize} is not an english word!"
    end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
