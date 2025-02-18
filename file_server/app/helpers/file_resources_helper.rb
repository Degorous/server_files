module FileResourcesHelper
  def render_file(file, options = {})
    if image?(file)
      image_tag(file, options)
    elsif video?(file)
      video_tag(file, {**options, controls: true})
    else
      link_to "Download", file
    end
  end

  private

  def file_extension(file)
    file.filename.extension.downcase
  end

  def image?(file)
    %w[jpg jpeg png gif bmp].include?(file_extension(file))
  end

  def video?(file)
    %w[mp4 mov avi mkv webm].include?(file_extension(file))
  end
end
