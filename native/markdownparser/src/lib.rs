mod markdown_parser;
mod node;

use markdown_parser::MarkdownLine;

#[rustler::nif]
fn parse(markdown_text: String) -> String {
    MarkdownLine::parse_markdown_to_html(markdown_text)
}

// #[rustler::nif]
// fn add(a: i64, b: i64) -> i64 {
//     a + b
// }

// rustler::init!("Elixir.MarkdownParser", [add]);
rustler::init!("Elixir.MarkdownParser", [parse]);
