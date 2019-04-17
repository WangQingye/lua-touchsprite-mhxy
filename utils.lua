require("TSLib")
require("utilfind")

-- 用于等待战斗界面
function waitFight()
	while (true) do
		local isFight = findUtil("战斗界面");
		if isFight == false then
			toast("战斗结束",2)
			break;
		else
			toast("战斗中...",2)
			mSleep(5000)
		end
	end	
end


-- 异常情况处理（比如有时候任务完了会出现一些道具使用，三界奇缘是否参加等等情况，这个时候就需要去关闭这些界面）
function dealUnusual()
	local unusuals = {"使用","对话框"};
	for i,v in ipairs(unusuals) do
		local ret = findUtil(v);
		if ret ~= false then
			randomTap(ret[1],ret[2],5);
			toast("处理异常:"..v,1)
			mSleep(3000)
		end
	end
end