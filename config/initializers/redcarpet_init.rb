renderer = Redcarpet::Render::HTML.new(filter_html: true, safe_links_only: true)

$markdown = Redcarpet::Markdown.new(renderer, fenced_code_block: true, disable_indented_code_blocks: true, strikethrough: true, superscript: true, tables: true)