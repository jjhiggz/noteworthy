mod markdown_parser;
mod node;

use markdown_parser::MarkdownLine;

#[rustler::nif]
fn parse(markdown_text: String) -> String {
    MarkdownLine::parse_markdown_to_html(markdown_text)
}

rustler::init!("Elixir.MarkdownParser", [parse]);
