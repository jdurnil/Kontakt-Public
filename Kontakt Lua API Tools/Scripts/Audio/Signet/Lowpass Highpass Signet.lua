local root_path = Filesystem.parent_path(Filesystem.parent_path(Filesystem.parent_path(Kontakt.script_path)))
package.path = root_path .. "/?.lua;" .. package.path

local kSignet = require("Modules.KSignet")
local kUtil = require("Modules.KUtil")
local kUser = require("Modules.KUser")

Kontakt.colored_output = kUser.terminal_colored_output

local current_path = kUser.framework_samples_path .. "/convert/"
local lp_cutoff = "8000"
local hp_cutoff = "200"
local sample_paths_table = {}

sample_paths_table = kUtil.paths_to_table(current_path,".wav")
table.sort(sample_paths_table)

for index,file in pairs(sample_paths_table) do
    kSignet.lowpass(file,lp_cutoff)
    kSignet.highpass(file,hp_cutoff)
end