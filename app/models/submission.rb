class Submission < ActiveRecord::Base
  belongs_to :language
  belongs_to :challenge

  validates_presence_of :language
  validates_presence_of :name
  validates_presence_of :code

  before_create :score_this

private
  def score_this
    self.score = self.code.size
  end
end
