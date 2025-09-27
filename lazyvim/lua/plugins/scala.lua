return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        metals = {
          keys = {
            {
              "<leader>m",
              function()
                require("telescope").extensions.metals.commands({
                  layout_config = {
                    height = 0.75
                  }
                })
              end,
              desc = "Metals commands",
            },
          },
          settings = {
            -- serverVersion = "1.4.0",
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },

            serverProperties = {
              "-Dmetals.enabled=true",
            },
            scalafixConfigPath = vim.env.HOME .. "/.scalafix.conf",
            -- javaHome = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home/jre",
            javaHome = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home",
            sbtScript = "/opt/homebrew/bin/sbt",
          },
          capabilities = require("blink-cmp").get_lsp_capabilities(nil, true)
        },
      },
    },
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
