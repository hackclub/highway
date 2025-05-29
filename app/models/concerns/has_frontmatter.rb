module HasFrontmatter
  extend ActiveSupport::Concern

  class_methods do
    def parse_frontmatter(content)
      if content =~ /\A(---\s*\n.*?\n?)^(---\s*$\n?)(.*)/m
        begin
          metadata = YAML.safe_load($1)
          metadata = {} unless metadata.is_a?(Hash)
        rescue Psych::SyntaxError, StandardError => e
          Rails.logger.warn "Failed to parse frontmatter: #{e.message}"
          metadata = {}
        end
        content = $3
        [ safe_parse_metadata(metadata), content ]
      else
        [ {}, content ]
      end
    end

    private

    def safe_parse_metadata(metadata)
      {
        "title" => safe_parse_field(metadata, "title"),
        "author" => safe_parse_field(metadata, "author"),
        "description" => safe_parse_field(metadata, "description"),
        "created_at" => safe_parse_date(metadata, "created_at")
      }
    end

    def safe_parse_field(metadata, field)
      return nil unless metadata.is_a?(Hash)
      value = metadata[field]
      return nil if value.nil?
      value.to_s.strip
    end

    def safe_parse_date(metadata, field)
      return nil unless metadata.is_a?(Hash)
      value = metadata[field]
      return nil if value.nil?

      begin
        Date.parse(value.to_s)
      rescue Date::Error
        nil
      end
    end
  end
end
