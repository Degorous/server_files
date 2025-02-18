module FileResourcesHelper
  def render_file(file)
    if image?(file)
      image_tag(file, class: "img-fluid")
    elsif video?(file)
      video_tag(file, controls: true, class: "video-fluid")
    else
      link_to "Download", file, class: "btn btn-primary"
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
