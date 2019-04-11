require("TSLib")
require("utilfind")
-- 当前是否有师门任务
local hasShimen = false;
-- 当前是否在循环查找师门按钮（为了防止多线程重复查找）
local doingShimen = false;

function findShimenTextByOcr()	
	for i = 1, 3 do
		local y1 = 220 + (i-1) * 120
		local y2 = 275 + (i-1) * 120
		recognize = ocrText(1296, y1, 1357, y2, 1);
--		师门二字识别不太准确，所以只判断是否有师字
		if string.find(recognize,"师") then
			return 1296 + 50, y1 + 50
		end
	end
end
function findShimenTextByColor()
	for i = 1, 3 do
		local y1 = 228 + (i-1) * 120
		local y2 = 268 + (i-1) * 120
		local x, y = findMultiColorInRegionFuzzy( 0xf3eb20, "14|8|0xe5de24,34|14|0xe9e221", 85, 1294, y1, 1358, y2)
		if x > -1 and y > -1 then
			return 1296 + 50, y1 + 50
		end
	end
end
-- 查看是否有师门任务
function testShimen()
	toast("开始师门任务",2)
	-- 师门找到过后理论上位置不会再变，而且做一个师门需要花费的时间比较长，所以师门的点击等待时间可以比较长
	local a, b = findShimenTextByColor();
	if a  > -1 and b  > -1 then
		hasShimen = true;
		randomTap(a,b,5);
		if doingShimen == false then
			doShimen();
		end
		-- 10秒后再次执行startShimen看看是否还有师门任务，如果有的话就点击
		mSleep(10000);
		testShimen();
	else
		hasShimen = false;
		toast("没有找到师门二字",2)
	end
end
-- 师门情况分类处理
-- 采集 - 使用 - 1
-- 巡逻 - 自动 - 2
function doShimen()
	toast("开始查找师门按钮",2)
	doingShimen = true;
	-- 有师门的时候才会去循环查找师门任务按钮
	while (hasShimen) do
		mSleep(5000);
		local retTable = findUtil("使用");
		if retTable ~= false then
			toast("找到使用按钮",2);
			randomTap(retTable[1],retTable[2],5);			
		end		
	end
end

testShimen();
