require("TSLib")
require("utilfind")
require("utils")
function startKeju()
	toast("开始科举",2)
	mSleep(3000);
	-- body
	while (true) do
		local isAnsering = findUtil("科举答题界面");
		if isAnsering ~= false then
			toast("科举中",1)
			randomTap(810,450,10)
		else
			randomTap(1430,70,5);
			toast("科举结束",2)
			break;
		end
		mSleep(4000)
	end
end