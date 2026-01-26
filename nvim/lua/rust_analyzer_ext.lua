
function lsp_client_is_rust_analyzer(client)
  return (client.server_info and client.server_info.name == "rust-analyzer")
    or client.name == "rust-analyzer"
    or client.name == "rust_analyzer"
end

function rust_analyzer_client(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr or 0 })
  for _, client in pairs(clients) do
    if lsp_client_is_rust_analyzer(client) then
      return client
    end
  end
end

function offset_encoding(client)
  return (client and client.offset_encoding) or "utf-16"
end

function request(method, params, handler)
  local on_response = function(responses)
    local response = responses[rust_analyzer_client().id]

    if response ~= nil then
      handler(response)
    else
      for _, response in pairs(responses) do
        handler(response)
        break
      end
    end

  end

  vim.lsp.buf_request_all(0, method, params, on_response)
end

vim.api.nvim_create_user_command(
  "RustAnalyzerMemoryLayout",
  function()
    request(
      "rust-analyzer/viewRecursiveMemoryLayout",
      vim.lsp.util.make_position_params(0, offset_encoding(rust_analyzer_client())),
      function(resp)
        local str = vim.fn.json_encode(resp)
        vim.notify(str)
      end
    )
  end,
  {}
)
