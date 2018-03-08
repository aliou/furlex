# XXX: Do not merge this when opening the PR.
defmodule Furlex.Parser.Custom do
  @behaviour Furlex.Parser

  def parse(html) do
    case Floki.find(html, "title") do
      nil -> {:ok, %{}}
      [] -> {:ok, %{}}
      elements ->
        content = Enum.reduce(elements, %{}, &to_map/2)
        {:ok, content}
    end
  end

  defp to_map({key, _attributes, [value | _rest]}, acc) do
    Map.put(acc, key, value)
  end
end
