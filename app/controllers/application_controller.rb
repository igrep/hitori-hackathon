# -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
  # 本来ならsettingsみたいなgemを使ってやるべきなんだろうけどあえて。
  # 簡単に切り替えられるのでテストしやすいかと思って。
  FILE_UPDATE_OK = File.join( Rails.root, 'config/update-ok' )
  protect_from_forgery

  before_filter :avoid_change, except: :unavailable_so_far
  private
  def avoid_change
    logger.info "#{__method__}: checking if #{FILE_UPDATE_OK} exists"
    unless File.exist? FILE_UPDATE_OK
      flash[:back_path] = request.referer
      redirect_to '/unavailable_so_far'
    end
  end
end
