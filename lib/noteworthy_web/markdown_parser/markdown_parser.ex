defmodule MarkdownParser do
  use Rustler,
    otp_app: :noteworthy,
    crate: :markdownparser

  def parse(_markdown_string), do: :erlang.nif_error(:nif_not_loaded)
end
