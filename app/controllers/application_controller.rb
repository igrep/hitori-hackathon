# -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
  # 本来ならsettingsみたいなgemを使ってやるべきなんだろうけどあえて。
  # 簡単に切り替えられるのでテストしやすいかと思って。
  FILE_NO_CHANGE = File.join( Rails.root, 'hitori-hackathon/no-change' )
  protect_from_forgery

  before_filter :avoid_change
  private
  def avoid_change
    logger.info "#{__method__}: checking if #{FILE_NO_CHANGE} exists"
    if File.exist? FILE_NO_CHANGE
      render text: 'Sorry, the operation can\'t be executed so far!'
    end
  end
end
