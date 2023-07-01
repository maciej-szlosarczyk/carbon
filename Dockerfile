FROM elixir:1.14

COPY ./mix.* ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix deps.compile

COPY ./ ./
RUN mix phx.digest
