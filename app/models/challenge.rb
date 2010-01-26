class Challenge < ActiveRecord::Base
  has_many :submissions
  belongs_to :user

  def lowest_score
    score = Submission.find(:first, :select=>"score", :order=>"score", :conditions=>{:challenge_id=>self.id})
    return (score.nil?? "None" : score.score)
  end

  def number_of_answers
    answers = Submission.find(:all, :conditions=>{:challenge_id=>self.id}).size
  end
end
