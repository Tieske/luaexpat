local package_name = "luaexpat"
local package_version = "dev"
local rockspec_revision = "1"
local github_account_name = "lunarmodules"
local github_repo_name = package_name
local git_checkout = package_version == "dev" and "master" or package_version


package = package_name
version = package_version .. "-" .. rockspec_revision

source = {
	url = "git://github.com/"..github_account_name.."/"..github_repo_name..".git",
	branch = git_checkout
}

description = {
	summary = "XML Expat parsing",
	detailed = [[
		LuaExpat is a SAX (Simple API for XML) XML parser based on the
		Expat library.
	]],
	license = "MIT/X11",
	homepage = "https://"..github_account_name..".github.io/"..github_repo_name,
}

dependencies = {
	"lua >= 5.0"
}

external_dependencies = {
	EXPAT = {
		header = "expat.h"
	}
}

build = {
	type = "builtin",
	modules = {
		lxp = {
			sources = { "src/lxplib.c" },
			libraries = { "expat" },
			incdirs = { "$(EXPAT_INCDIR)", "src/" },
			libdirs = { "$(EXPAT_LIBDIR)" },
		},
		["lxp.lom"] = "src/lxp/lom.lua",
		["lxp.totable"] = "src/lxp/totable.lua",
	},
	copy_directories = { "docs", "spec" }
}
