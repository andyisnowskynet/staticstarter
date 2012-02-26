module ApplicationHelper
  # make sure you add your google analytics code to config/settings.yml
  def google_analytics_script
    "<script type='text/javascript'>var _gaq = _gaq || [];_gaq.push(['_setAccount', '#{Settings[:google_analytics_code]}']);_gaq.push(['_trackPageview']);(function() {var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);})();</script>"
  end
  
  # for rendering nested layouts
  # example:
  # = inside_layout 'application' do
  #   <h1>Nested Layout</h1>
  #   = yield
  def inside_layout layout = 'application', &block
    render :inline => capture_haml(&block), :layout => "layouts/#{layout}"
  end
  
end
