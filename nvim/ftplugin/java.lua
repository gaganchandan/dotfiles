local config = {
    cmd = {'/usr/bin/jdtls',},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'pom.xml'}, { upward = true })[1]),
    settings = {
        java = {
            format = {
                settings = {
                    url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
        }
    }
}
require('jdtls').start_or_attach(config)
