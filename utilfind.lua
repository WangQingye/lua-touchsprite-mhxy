-- 一个公用的查找函数，用来查找一些常见的按钮位置
function findUtil(name)
	table = utilPosition[name]
	local a, b = findMultiColorInRegionFuzzy(table[1], table[2], table[3], table[4], table[5], table[6], table[7])
	if a > -1 and b > -1 then
		return {a,b}
	else
		return false
	end
end

utilPosition = {}
-- 使用
utilPosition["使用"] = {0x6c310a, "13|17|0x70350c,-2|34|0xedba48", 90, 1368, 697, 1414, 746}