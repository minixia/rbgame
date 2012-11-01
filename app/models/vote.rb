#coding: utf-8
class Vote < ActiveRecord::Base
  belongs_to :game

  def judge(against_vote)
    if(self.round != against_vote.round || self.game_id != against_vote.game_id)
      throw "轮数不匹配或者游戏不匹配"
    end
    score = 0
    against_score = 0
    if(self.vote == against_vote.vote && self.vote == "红")
      score = 1
      against_score = 1
    elsif(self.vote == against_vote.vote && self.vote == "黑")
      score = -1
      against_score = -1
    elsif(self.vote != against_vote.vote && self.vote == "红")
      score = -3
      against_score = 3
    elsif(self.vote != against_vote.vote && self.vote == "黑")
      score = 3
      against_score = -3
    end
    if(self.round > 8)
      score = score * 3
      against_score = against_score * 3
    end
    self.score = score
    self.save!
    against_vote.score = against_score
    against_vote.save!
  end
end
