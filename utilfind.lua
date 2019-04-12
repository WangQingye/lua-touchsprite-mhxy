-- 一个公用的查找函数，用来查找一些常见的按钮位置
function findUtil(name)
	table = utilPosition[name]
	local a, b = findMultiColorInRegionFuzzy(table[1], table[2], table[3], table[4], table[5], table[6], table[7])
	if a ~= nil and b > -1 then
		return {a,b}
	else
		return false
	end
end

utilPosition = {}
-- 使用
utilPosition["使用"] = {0x6c310a, "13|17|0x70350c,-2|34|0xedba48", 90, 1368, 697, 1414, 746}
utilPosition["购买"] = {0xfffefe, "0|-17|0xf3ece7,7|-7|0xedb94f", 90, 1297, 785, 1350, 831}
utilPosition["上交"] = {0x6f340c, "-1|8|0xf7d36d,0|20|0x6c310a", 90, 1062, 713, 1098, 749}
utilPosition["送信对话框"] = {0xe7b578, "-27|-9|0xf4cfa5,-43|-36|0xf8d4ab", 90, 402, 827, 474, 888}
utilPosition["选择要做师门1"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 314, 1368, 336}
utilPosition["选择要做师门2"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 398, 1368, 420}
utilPosition["选择要做师门3"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 482, 1368, 504}
utilPosition["选择要做师门4"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 566, 1368, 588}
utilPosition["兵器购买"] = {0xffffff, "-13|17|0xc17b36,19|8|0xf9d275", 90, 1078, 682, 1139, 738}
utilPosition["兵器购买上交"] = {0x6e340c, "-1|10|0xf6d069,-1|19|0x6e330b", 90, 1319, 713, 1356, 751}