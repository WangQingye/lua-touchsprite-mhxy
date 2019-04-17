require("TSLib")
require("utilfind")
require("utils")
function startYabiao()
	toast("开始押镖",2)
	mSleep(3000);
	-- 点击开始押镖
	randomTap(1320,500,5)
	mSleep(2000);
	-- 点击确定押镖
	randomTap(920,540,5)
	mSleep(5000);
	-- body
	waitYabiao();
end

function waitYabiao()
	while (true) do
		local ret = findUtil("战斗界面");
		local retA = findUtil("地图界面");
		if ret ~= false or retA ~= false then
			toast("押镖中",2)
		else
			toast("押镖结束",1)
			break;
		end
		mSleep(8000)
	end
end