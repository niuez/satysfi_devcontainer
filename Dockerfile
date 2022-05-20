FROM rust AS lsp_builder
RUN git clone https://github.com/monaqa/satysfi-language-server && \
    cd satysfi-language-server && \
    cargo build --release
FROM amutake/satysfi
COPY --from=lsp_builder /satysfi-language-server/target/release/satysfi-language-server /satysfi-language-server
ENV PATH=$PATH:/root/.opam/4.12.1/bin