module MarkdownRenderable
  extend ActiveSupport::Concern

  class_methods do
    def render_markdown(text, user = nil, project_name = nil)
      return "" if text.blank?

      renderer = if user && project_name
                  Class.new(Redcarpet::Render::HTML) do
                    def initialize(user, project_name)
                      @user = user
                      @project_name = project_name
                      super()
                    end

                    def image(link, title, alt_text)
                      # If the link is a relative path, rewrite it
                      unless link =~ %r{^https?://}
                        link = "/projects/#{@user}/#{@project_name}/#{link}"
                      end
                      "<img src=\"#{link}\" alt=\"#{alt_text}\" title=\"#{title}\">"
                    end

                    def postprocess(full_document)
                      # Only rewrite src attributes in img tags that don't already have the project path
                      full_document.gsub(/<img[^>]+src="([^"]+)"[^>]*>/) do |match|
                        src = $1
                        unless src =~ %r{^https?://} || src.start_with?("/projects/#{@user}/#{@project_name}/")
                          src = "/projects/#{@user}/#{@project_name}/#{src}"
                        end
                        match.gsub(/src="[^"]+"/, "src=\"#{src}\"")
                      end
                    end
                  end.new(user, project_name)
      else
                  Redcarpet::Render::HTML
      end

      markdown = Redcarpet::Markdown.new(
        renderer,
        autolink: true,
        tables: true,
        fenced_code_blocks: true,
        strikethrough: true,
        superscript: true,
        underline: true,
        highlight: true,
        quote: true,
        footnotes: true
      )

      markdown.render(text).html_safe
    end
  end

  private

  def render_markdown(text, user = nil, project_name = nil)
    self.class.render_markdown(text, user, project_name)
  end
end
