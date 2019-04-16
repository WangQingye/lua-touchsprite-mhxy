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