class HighScoreController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  WADDLE_WAR_SECRET_KEY = "u8T1eg"
  FROG_GAME_SECRET_KEY = "j3IDv6"

  def post_score
    game = params[:game_name].presence
    name = params[:name].presence
    score = params[:score].presence
    secure_hash = params[:hash].presence
    case game
    when 'waddle_war'
      calcd_hash = Digest::MD5.hexdigest("#{name}#{score}#{WADDLE_WAR_SECRET_KEY}")
      if name && score && calcd_hash == secure_hash
        WaddleWarScore.create! :name => name,
                               :score => score
        return render :text => "OK"
      end
    when 'frog_game'
      calcd_hash = Digest::MD5.hexdigest("#{name}#{score}#{FROG_GAME_SECRET_KEY}")
      if name && score && calcd_hash == secure_hash
        FrogGameScore.create! :name => name,
                               :score => score
        return render :text => "OK"
      end
    end
  end

  def show_score
    time_frame = params[:tf].presence || "daily"
    game = params[:game_name].presence
    case game
    when 'waddle_war'
      score_class = WaddleWarScore
    when 'frog_game'
      score_class = FrogGameScore
    end
    case time_frame
    when 'all_time'
      scores = score_class.order(score: :desc).limit(5)
    when 'monthly'
      scores = score_class.where('created_at >= ?', 1.months.ago).order(score: :desc).limit(5)
    else
      scores = score_class.where('created_at >= ?', 1.days.ago).order(score: :desc).limit(5)
    end
    t = ""
    scores.each { |score| t += "#{score.name.gsub(' ', '')[0...5]} #{score.score.to_s} " }
    return render :text => t
  end
end
