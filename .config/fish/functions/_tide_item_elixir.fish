function _tide_item_elixir
  test -e mix.exs && _tide_print_item elixir $tide_elixir_icon' ' (elixir --eval "IO.puts(System.version())" | string trim --chars=v)
end
