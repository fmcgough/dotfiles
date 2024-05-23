return {
  {
    "scalameta/nvim-metals",
    init = function()
      local metals_config = require("metals").bare_config()
      metals_config.init_options.statusBarProvider = "off"
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        serverProperties = {
          "-Dmetals.enabled=true",
        },
        scalafixConfigPath = vim.env.HOME .. "/.scalafix.conf",
        javaHome = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home/jre",
        sbtScript = "/opt/homebrew/bin/sbt",
      }
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
      end

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        -- NOTE: You may or may not want java included here. You will need it if you
        -- want basic Java support but it may also conflict if you are using
        -- something like nvim-jdtls which also works on a java filetype autocmd.
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })

      -- Debug settings
      local dap = require("dap")
      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end,
  },

  {
    "stevanmilic/neotest-scala",
  },

  {
    "nvim-neotest/neotest",
    depedencies = {
      "stevanmilic/neotest-scala",
    },
    opts = function(_, opts)
      opts.adapters = { "neotest-scala"}
    end
  },
}
