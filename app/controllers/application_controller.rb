# -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
  # 本来ならsettingsみたいなgemを使ってやるべきなんだろうけどあえて。
  # 簡単に切り替えられるのでテストしやすいかと思って。
  FILE_UPDATE_OK = File.join( Rails.root, 'hitori-hackathon/update-ok' )
  protect_from_forgery

  before_filter :avoid_change
  private
  def avoid_change
    logger.info "#{__method__}: checking if #{FILE_UPDATE_OK} exists"
    unless File.exist? FILE_UPDATE_OK
      render text: 'Sorry, the operation can\'t be executed so far!'
    end
  end
end
