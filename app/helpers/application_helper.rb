module ApplicationHelper

	def collapser
		link_to("#",class: "btn btn-navbar", data: {toggle: "collapse", target: ".nav-collapse"}) do
			("<span class='icon-bar'>"*3).html_safe
		end
	end


end
