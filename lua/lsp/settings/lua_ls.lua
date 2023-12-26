return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagostics = {
        globals = {
          "vim",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false,
      },
    }
  },
}
