class Challenge < ActiveRecord::Base
  has_many :submissions
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :regex
  validates_presence_of :example_output

  def lowest_score
    score = Submission.find(:first, :select=>"score", :order=>"score", :conditions=>{:challenge_id=>self.id})
    return (score.nil?? "None" : score.score)
  end

  def number_of_answers
    answers = Submission.find(:all, :conditions=>{:challenge_id=>self.id}).size
  end
end
