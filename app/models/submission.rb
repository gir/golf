class Submission < ActiveRecord::Base
  belongs_to :language
  belongs_to :challenge

  validates_presence_of :language
  validates_presence_of :name
  validates_presence_of :code

  before_create :score_this

  private
  def score_this
    score = 0
    self.code.each_char() do |x|
      score += x=~/[a-z0-9.,\/\\`;'=-\[\] ]/ ? 1:2
    end
    self.score = score
  end
end
