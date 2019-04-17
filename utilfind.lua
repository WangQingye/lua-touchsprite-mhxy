require("TSLib")
-- 一个公用的查找函数，用来查找一些常见的按钮位置
function findUtil(name)
	local table = utilPosition[name]
	local a, b = findMultiColorInRegionFuzzy(table[1], table[2], table[3], table[4], table[5], table[6], table[7])
	if a ~= nil and b > -1 then
		return {a,b}
	else
		return false
	end
end

-- 查看任务完成情况
function findMisson()
	local ret = findUtil("活动按钮")
	local missonsNoFinish = {};
	if ret ~= false then
		randomTap(ret[1],ret[2],5);
		mSleep(3000)
		local missons = {"师门","抓鬼","宝图","科举","三界奇缘","押镖","秘境"};		
		-- X,Y是第二排左边的基点，只要两个点是因为长方形的宽高是固定的
		local baseX = utilPosition["任务基点坐标"][1];
		local baseY = utilPosition["任务基点坐标"][2];
		-- 总共六个点，前三排的任务，144和513是固定的
		local positions = {{baseX,baseY-144}, {baseX,baseY}, {baseX, baseY+144}, {baseX+513, baseY-144}, {baseX+513, baseY}, {baseX+513, baseY+144}}
		for i,v in ipairs(missons) do
			local missonTable = utilPosition[v];
			for o, p in ipairs(positions) do
				-- 488和121是查找区域的长方形宽高
				local retA, retB = findMultiColorInRegionFuzzy(missonTable[1], missonTable[2], 90, p[1], p[2], p[1]+488, p[2]+121); 
				if retA ~= nil and retB > -1 then
					toast(v.."还未完成",2);
					table.insert(missonsNoFinish, {v, retA, retB});
					mSleep(2000)
				end
			end
		end
	end
	return missonsNoFinish;
end
utilPosition = {}
-- 任务特征
utilPosition["活动按钮"] = {0xe4c4a6, "13|-13|0xc21f1b,-43|-27|0xfcf1d4", 90, 400, 8, 484, 96}
utilPosition["任务基点坐标"] = {400, 270, 888, 391}
utilPosition["师门"] = {0xfafa83, "-1|48|0xbb6611,315|28|0xf5ce67"}
utilPosition["抓鬼"] = {0xfe856c, "34|5|0x6666cc,331|-8|0xfcde7e"}
utilPosition["宝图"] = {0x48b97a, "41|-17|0xfefecf,349|-26|0xfcde7e"}
utilPosition["押镖"] = {0xfbdc7b, "-327|-2|0xc9d1d1,-330|37|0x455667"}
utilPosition["秘境"] = {0xfcde7e, "-327|-4|0x239e33,-315|44|0x1bd6c5"}
utilPosition["科举"] = {0xfcdd7e, "-317|-5|0xfce9cf,-309|33|0x5384ef"}
utilPosition["三界奇缘"] = {0xfbdc7b, "-317|27|0xaf2727,-333|-11|0xfff1d8"}
-- 师门按钮
utilPosition["使用"] = {0x6c310a, "13|17|0x70350c,-2|34|0xedba48", 90, 1368, 697, 1414, 746}
utilPosition["购买"] = {0xfffefe, "0|-17|0xf3ece7,7|-7|0xedb94f", 90, 1297, 785, 1350, 831}
utilPosition["上交"] = {0x6f340c, "-1|8|0xf7d36d,0|20|0x6c310a", 90, 1062, 713, 1098, 749}
utilPosition["商会购买"] = {0xf4cd78, "31|1|0xfdfcfc,-34|-13|0xffffff", 90, 1125, 789, 1209, 830}
utilPosition["送信对话框"] = {0xe7b578, "-27|-9|0xf4cfa5,-43|-36|0xf8d4ab", 90, 402, 827, 474, 888}
utilPosition["选择要做师门1"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 314, 1368, 336}
utilPosition["选择要做师门2"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 398, 1368, 420}
utilPosition["选择要做师门3"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 482, 1368, 504}
utilPosition["选择要做师门4"] = {0x6f350e, "5|0|0xf0dbbd,11|6|0x6f350e", 90, 1344, 566, 1368, 588}
utilPosition["兵器购买"] = {0xffffff, "-13|17|0xc17b36,19|8|0xf9d275", 90, 1078, 682, 1139, 738}
utilPosition["兵器购买上交"] = {0x6e340c, "-1|10|0xf6d069,-1|19|0x6e330b", 90, 1319, 713, 1356, 751}
utilPosition["战斗界面"] = {0xfffef6, "-20|21|0x0a0a03,12|23|0xe5b65e", 90, 15, 33, 68, 91}
utilPosition["师门结束"] = {0xfbdd7d, "0|6|0x4b3320,0|11|0xf8d470", 90, 613, 519, 639, 547}
-- 秘境
utilPosition["秘境地图"] = {0xf8ecb7, "20|0|0x432127,54|-2|0xf9efbe", 90, 1308, 359, 1387, 402}
utilPosition["秘境进入战斗"] = {0xf2e0c5, "-5|8|0x773f19,6|12|0x6d320b", 90, 1283, 474, 1316, 505}
utilPosition["秘境失败"] = {0x7a97a4, "-2|10|0x7f0b0f,-11|19|0xcb7f2f", 90, 944, 268, 982, 310}
-- 科举
utilPosition["科举答题界面"] = {0xbf5d0a, "-11|21|0x5b1a03,-20|40|0xca8f54", 90, 603, 132, 682, 211}
-- 奇缘
utilPosition["奇缘答题界面"] = {0xbc580d, "-11|19|0x5e1902,-23|33|0xe4b076", 90, 584, 105, 637, 161}
-- 押镖
utilPosition["地图界面"] = {0xe64643, "9|-17|0xdfdbd3,-2|33|0xe0b956", 90, 407, 108, 459, 192}
-- 异常情况
utilPosition["对话框"] = {0xf0cda5, "-1|9|0x61633d,8|9|0xf0cda5", 90, 1529, 698, 1555, 722}