class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.like(user, post)
    
    create(user: user, post: post)
  end

  def self.unlike(user, post)
    like = find_by(user: user, post: post)
    like.destroy if like
  end

end
