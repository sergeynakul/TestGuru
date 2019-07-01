module TestsHelper
  def format_timer(test)
    unless test.timer.nil?
      if test.timer <= 60
        format('00:' '%02d', (test.timer / 60).to_s)
      else
        test.timer * 60
        format('%02d', (test.timer / 60).to_s) + format(':' '%02d', (test.timer % 60).to_s)
      end
    end
  end
end
