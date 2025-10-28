return {
  {
    "scalameta/nvim-metals",
    opts = function()
      local metals_config = require("metals").bare_config()

      metals_config.init_options.statusBarProvider = "off"
      metals_config.settings = {
        verboseCompilation = true,

        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        showInferredType = true,
        superMethodLensesEnabled = true,
        excludedPackages = {
          "akka.actor.typed.javadsl",
          "org.apache.pekko.actor.typed.javadsl",
          "com.github.swagger.akka.javadsl",
        },
        testUserInterface = "Test Explorer",
        -- serverVersion = "1.4.0",

        serverProperties = {
          "-Dmetals.enabled=true",
        },
        scalafixConfigPath = vim.env.HOME .. "/.scalafix.conf",
        -- javaHome = "/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home/jre",
        javaHome = "/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home",
        sbtScript = "/opt/homebrew/bin/sbt",
      }

      return metals_config
    end,

    ft = { "scala", "sbt", "java" },
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
      opts.adapters = { "neotest-scala" }
    end,
  },
}
