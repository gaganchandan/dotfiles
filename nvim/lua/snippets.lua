local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    -- Greek alphabet
    s("alpha", {
        t("α"),
    }),
    s("Alpha", {
        t("Α"),
    }),
    s("beta", {
        t("β"),
    }),
    s("Beta", {
        t("Β"),
    }),
    s("gamma", {
        t("γ"),
    }),
    s("Gamma", {
        t("Γ"),
    }),
    s("delta", {
        t("δ"),
    }),
    s("Delta", {
        t("Δ"),
    }),
    s("epsilon", {
        t("ε"),
    }),
    s("Epsilon", {
        t("Ε"),
    }),
    s("zeta", {
        t("ζ"),
    }),
    s("Zeta", {
        t("Ζ"),
    }),
    s("eta", {
        t("η"),
    }),
    s("Eta", {
        t("Η"),
    }),
    s("theta", {
        t("θ"),
    }),
    s("Theta", {
        t("Θ"),
    }),
    s("iota", {
        t("ι"),
    }),
    s("Iota", {
        t("Ι"),
    }),
    s("kappa", {
        t("κ"),
    }),
    s("Kappa", {
        t("Κ"),
    }),
    s("lambda", {
        t("λ"),
    }),
    s("Lambda", {
        t("Λ"),
    }),
    s("mu", {
        t("μ"),
    }),
    s("Mu", {
        t("Μ"),
    }),
    s("nu", {
        t("ν"),
    }),
    s("Nu", {
        t("Ν"),
    }),
    s("xi", {
        t("ξ"),
    }),
    s("Xi", {
        t("Ξ"),
    }),
    s("omicron", {
        t("ο"),
    }),
    s("Omicron", {
        t("Ο"),
    }),
    s("pi", {
        t("π"),
    }),
    s("Pi", {
        t("Π"),
    }),
    s("rho", {
        t("ρ"),
    }),
    s("Rho", {
        t("Ρ"),
    }),
    s("sigma", {
        t("σ"),
    }),
    s("Sigma", {
        t("Σ"),
    }),
    s("tau", {
        t("τ"),
    }),
    s("Tau", {
        t("Τ"),
    }),
    s("upsilon", {
        t("υ"),
    }),
    s("Upsilon", {
        t("Υ"),
    }),
    s("phi", {
        t("φ"),
    }),
    s("Phi", {
        t("Φ"),
    }),
    s("chi", {
        t("χ"),
    }),
    s("Chi", {
        t("Χ"),
    }),
    s("psi", {
        t("ψ"),
    }),
    s("Psi", {
        t("Ψ"),
    }),
    s("omega", {
        t("ω"),
    }),
    s("Omega", {
        t("Ω"),
    }),
    -- Blackboard letters 
    s("mathbbA", {
        t("𝔸"),
    }),
    s("mathbbB", {
        t("𝔹"),
    }),
    s("mathbbC", {
        t("ℂ"),
    }),
    s("mathbbD", {
        t("𝔻"),
    }),
    s("mathbbE", {
        t("𝔼"),
    }),
    s("mathbbF", {
        t("𝔽"),
    }),
    s("mathbbG", {
        t("𝔾"),
    }),
    s("mathbbH", {
        t("ℍ"),
    }),
    s("mathbbI", {
        t("𝕀"),
    }),
    s("mathbbJ", {
        t("𝕁"),
    }),
    s("mathbbK", {
        t("𝕂"),
    }),
    s("mathbbL", {
        t("𝕃"),
    }),
    s("mathbbM", {
        t("𝕄"),
    }),
    s("mathbbN", {
        t("ℕ"),
    }),
    s("mathbbO", {
        t("𝕆"),
    }),
    s("mathbbP", {
        t("ℙ"),
    }),
    s("mathbbQ", {
        t("ℚ"),
    }),
    s("mathbbR", {
        t("ℝ"),
    }),
    s("mathbbS", {
        t("𝕊"),
    }),
    s("mathbbT", {
        t("𝕋"),
    }),
    s("mathbbU", {
        t("𝕌"),
    }),
    s("mathbbV", {
        t("𝕍"),
    }),
    s("mathbbW", {
        t("𝕎"),
    }),
    s("mathbbX", {
        t("𝕏"),
    }),
    s("mathbbY", {
        t("𝕐"),
    }),
    s("mathbbZ", {
        t("ℤ"),
    }),
     -- Logic notation
    s("exists", {
        t("∃"),
    }),
    s("nexists", {
        t("∄"),
    }),
    s("forall", {
        t("∀"),
    }),
    s("and", {
        t("∧"),
    }),
    s("or", {
        t("∨"),
    }),
    s("neg", {
        t("¬"),
    }),
    s("rightarrow", {
        t("→"),
    }),
    s("Rightarrow", {
        t("⇒"),
    }),
    s("leftarrow", {
        t("←"),
    }),
    s("Leftarrow", {
        t("⇐"),
    }),
    s("Longrightarrow", {
        t("⟹"),
    }),
    s("implies", {
        t("⟹"),
    }),
    s("Longleftarrow", {
        t("⟸"),
    }),
    s("iff", {
        t("⟺"),
    }), 
    s("leftrightarrow", {
        t("↔"),
    }),
    s("Leftrightarrow", {
        t("⇔"),
    }),
})
