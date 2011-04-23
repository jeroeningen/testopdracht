self.link_to_fancybox_or_not = (url, args) -> 
	if $('input#enable_lightbox')[0].checked
		$.fancybox({href: url})
	else
		document.location = url

#this function needs to be globally available, 
#because it is also used in the lightbox that is loaded later
self.go_back =-> 
	if $('input#enable_lightbox')[0].checked
		$.fancybox.close()
	else
		history.back()
		
$(document).ready -> 
	$('a.delete_link_fancybox').click ->
		if $('input#enable_lightbox')[0].checked
			$.fancybox
				href: this + '?enable_lightbox=1',
				http_method: 'delete'
			
			false
		else
			confirm('Are you sure?')
	$('form#form_to_enable_lightbox').change ->
		$('form#form_to_enable_lightbox').submit()
