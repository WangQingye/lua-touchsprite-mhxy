require("TSLib")
require("utilfind")
require("utils")
function startMijing()
	toast("开始秘境",2)
	-- body
	mSleep(5000);
	-- 点击秘境降妖
	randomTap(1300,325);
	mSleep(3000);
	-- 点击第一关
	randomTap(420,450);	
	mSleep(2000);
	-- 点击挑战
	randomTap(830,640);	
	mSleep(2000);
	-- 进入地图后点击第一关
	randomTap(1430,280);
	mSleep(2000);
	waitMijing();
end

-- 用于等待秘境
function waitMijing()
	while (true) do
		local isFight = findUtil("战斗界面");
		local isMijing = findUtil("秘境地图");
		local zhandouBtn = findUtil("秘境进入战斗");
		local isFail = findUtil("秘境失败");
		if isFail ~= false then
			-- 退出失败界面
			randomTap(isFail[1],isFail[2],5);
			mSleep(2000);
			-- 退出秘境
			randomTap(1500,370);
			mSleep(3000);
			break;
		elseif zhandouBtn ~= false then
			-- 点击进入战斗
			randomTap(1350,500);
		elseif isFight == false and isMijing == false then
			toast("秘境结束",2)
			break;
		else
			toast("秘境中...",2)
		end
		mSleep(10000)
	end	
end