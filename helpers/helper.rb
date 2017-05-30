module Helper

  # Takes comma-separated string, converts to array
  def prepare_guess_array(params)
    # Get just those params with colors.
    color_params = params.select { |key, value| /peg\d/.match(key) }
    # Convert to array: get sorted array of keys, then add values to array.
    color_keys = color_params.keys.sort;
    color_keys.map! { |key| color_params[key] }
  end

end
