# frozen_string_literal: true

class Follow < ApplicationRecord
  before_create :check_privacy
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :followed, class_name: 'User', foreign_key: 'followed_id'

  def accept
    update(accepted: true)
  end

  private

  def check_privacy
    self.accepted = true unless followed.private
  end
end
