require("TSLib")
require("utilfind")
require("utils")
require("shimen")
require("yabiao")
require("mijing")
require("keju")
require("sanjieqiyuan")

local missonFuncs = {};
missonFuncs["师门"] = startShime;
missonFuncs["押镖"] = startYabiao;
missonFuncs["秘境"] = startMijing;
missonFuncs["科举"] = startKeju;
missonFuncs["三界奇缘"] = startQiyuan;
while (true) do
	dealUnusual();
	toast("开始查找任务",3)
	local missons = findMisson();
	for i,v in ipairs(missons) do
		if missonFuncs[v[1]] ~= nil then
			if v[1] == "师门" then
				-- 有的任务需要关闭活动界面，有的任务不需要，可以直接从
				randomTap(1429,50,5);
				mSleep(2000);
			else
				randomTap(v[2], v[3], 5);
				toast("点击参加"..v[1],1)
			end
			missonFuncs[v[1]]();
			break;
		end
	end
	mSleep(30000)
end

