require("TSLib")
require("utilfind")
require("utils")

-- 当前是否有师门任务
local hasShimen = true;
-- 这两个变量的作用是用来标志查找次数，因为在师门的任务间隙，有可能第一次找不到，如果两次间隔10秒都找不到，才证明确实没有
local findShimen1 = true;
local findShimen2 = true;
local findShimen3 = true;
local findShimen4 = true;

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
		if x ~= nil and y > -1 then
			return 1296 + 50, y1 + 50
		end
	end
end
-- 查看是否有师门任务
function testShimen()
	-- 师门找到过后理论上位置不会再变，而且做一个师门需要花费的时间比较长，所以师门的点击等待时间可以比较长
	local a, b = findShimenTextByColor();
	if a ~= nil and b > -1 then
		hasShimen = true;
		findShimen1 = true;
		findShimen2 = true;
		findShimen3 = true;		
		findShimen4 = true;
		randomTap(a,b,5);
		doShimen();
	else
		if findShimen1 == true then
			findShimen1 = false
			toast("一次没有找到师门",2)
		elseif findShimen2 == true then
			findShimen2 = false
			toast("两次没有找到师门",2)
		elseif findShimen3 == true then
			findShimen3 = false
			toast("三次没有找到师门",2)
		elseif findShimen4 == true then
			findShimen4 = false
		end		
		if findShimen1 == false and findShimen2 == false then
			if findShimen3 == false and findShimen4 == false then
				hasShimen = false;
				toast("四次没有找到师门，师门结束",2)
			end
		end
	end
end
-- 师门情况分类处理
function doShimen()
	toast("开始查找师门按钮",2)
	-- 有师门的时候才会去循环查找师门任务按钮
	local findShimenBtn1 = true;	
	local findShimenBtn2 = true;
	local findShimenBtn3 = true;
	local findShimenBtn4 = true;
	while (hasShimen) do
		local isFind = false;
		mSleep(5000);
		local shimenText = {"战斗界面","使用","购买","上交","商会购买","兵器购买","兵器购买上交","选择要做师门1","选择要做师门2","选择要做师门3","选择要做师门4","送信对话框"};
		local retTable;
		for i,v in ipairs(shimenText) do
			retTable = findUtil(v);
			if retTable ~= false then
				randomTap(retTable[1],retTable[2],5);
				toast("找到按钮："..v,2);
				-- 因为这两个按钮还有下一次点击（上交），所以这里就算找到了也算没找到
				if (v == "购买" or v == "兵器购买") then
					isFind = false;
				elseif (v == "商会购买") then
					isFind = false;
					-- 如果是战斗界面，那么给1分钟的战斗时间
				elseif (v == "战斗界面") then
					waitFight();
					isFind = true;
				else
					isFind = true;					
				end
				break;
			end
		end
		if retTable == false then
			if findShimenBtn1 == true then
				findShimenBtn1 = false
				toast("一次没有找到师门按钮",2)
			elseif findShimenBtn2 == true then
				findShimenBtn2 = false
				toast("两次没有找到师门按钮",2)
			elseif findShimenBtn3 == true then
				findShimenBtn3 = false
				toast("三次没有找到师门按钮",2)
			elseif findShimenBtn4 == true then
				findShimenBtn4 = false
			end		
			if findShimenBtn1 == false and findShimenBtn2 == false then
				if findShimenBtn3 == false and findShimenBtn4 == false then
					toast("这不是一个需要点击的师门任务",2)
					break;
				end
			end
		end
		if isFind then
			break;
		end
	end
end
function findShimenEnd()
	local ret = findUtil("师门结束");
	if ret ~= false then
		randomTap(ret[1],ret[2],5);
		mSleep(2000);
		hasShimen = false;
	end
end
function startShime()
	-- 有时候失败了，再次通过主程序进来的时候，要重置一下hasShimen
	hasShimen = true;
	while (true) do
		toast("准备开始师门",2);	
		dealUnusual();
		findShimenEnd();
		if hasShimen == false then
			toast("二十次师门结束！",2);	
			break;
		else
			testShimen();
		end
		mSleep(3000);
	end
end
