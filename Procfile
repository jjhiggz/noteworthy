# this is the default Procfile used if the user does not specify one
# TODO: should upgrade, remote_console, etc be customizable like this
# init command is?
web: if [ -x "$(command -v mix)" ];  then cd native/markdownparser && cargo build && cd ../.. && elixir --name $MY_NODE_NAME --cookie $MY_COOKIE -S mix phoenix.server; else cd native/markdownparser && cargo build && cd ../.. && /app/bin/$GIGALIXIR_APP_NAME $GIGALIXIR_COMMAND; fi