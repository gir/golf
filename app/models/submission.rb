class Submission < ActiveRecord::Base
  belongs_to :language
  belongs_to :challenge
  belongs_to :user

  validates_presence_of :language
  validates_presence_of :code

  before_create :score_and_check

  private
  def score_and_check
    score = 0
    self.code.each_char() do |x|
      score += x=~/[a-z0-9.,\/\\`;'=-\[\] ]/ ? 1:2
    end
    self.score = score
    
=begin
    # Leave this here for now but it does not work if there are single quotes
    # like puts 'asdf' for example.
    # Do some crazy checking here.
    if (self.language.name == 'Ruby')
      output = `echo '#{self.code}' | ruby`
      debugger
      self.passes = !output.match(Regexp.new(self.challenge.regex)).blank?
    end
=end
    # Always passes for now until this is implemented.
    self.passes = true
    # Just make sure that this does not return false.
    self
  end
end
