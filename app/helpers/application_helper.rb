module ApplicationHelper

	def collapser
		link_to("#",class: "btn btn-navbar", data: {toggle: "collapse", target: ".nav-collapse"}) do
			("<span class='icon-bar'>"*3).html_safe
		end
	end

	def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
