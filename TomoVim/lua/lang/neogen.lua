local status_ok, _ = pcall(require, "neogen")
if not status_ok then
  return
end

require("neogen").setup({
	enabled = true,
	languages = {
		lua = {
			template = {
				annotation_convention = "emmylua",
			},
		},
		python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
    c = {
      template = {
        annotation_convention = "doxygen",
      },
    },
    cpp = {
      template = {
        annotation_convention = "doxygen",
      },
    },
	},
})
