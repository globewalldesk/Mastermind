module Helper

  # Takes comma-separated string, converts to array
  def prepare_guess_array(params)
    guess = params[:guess].split(',')
  end

end
