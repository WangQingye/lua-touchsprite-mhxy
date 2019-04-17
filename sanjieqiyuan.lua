require("TSLib")
require("utilfind")
require("utils")
function startQiyuan()
	toast("开始三界奇缘",2)
	mSleep(3000);
	-- body
	while (true) do
		local isAnsering = findUtil("奇缘答题界面");
		if isAnsering ~= false then
			toast("三界奇缘中",1)
			randomTap(710,330,10)
		else
			randomTap(1430,70,5);
			toast("三界奇缘结束",2)
			break;
		end
		mSleep(4000)
	end
end