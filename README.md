# iOS-Proficiency-Exercise
# Universal iOS Application

iOS Proficiency Test for prospective employers to observe my workflow and coding style


# Specifications
Create	a	universal	iOS	app	which:	
- Ingests	a	json	feed
- Displays	the	content	(including	image,	title	and	description)	in	a	
table		
- The	title	in	the	navbar	should	be	updated	from	the	json		
- Each	row	should	be	the	right	height	to	display	its	own	content	
and	no	taller.	No	content	should	be	clipped.		This	means	some	
rows	will	be	larger	than	others.		
- Loads	the	images	lazily		
- Don’t	download	them	all	at	once,	but	only	as	needed		
- Refresh	function (Either	place	a	refresh	button	or	use	pull	down	to	refresh.)		
- Should	not	block	UI	when	loading	the	data	from	the	json	feed.		

# Plan of Approach
1. Install relevant pods
        
        pod 'Alamofire' # HTTP requests
        pod 'SwiftJSON' # JSON Parsing
        pod 'SDWebImage' # Easily asynchronously download & cache images
        pod 'Fabric' # Required by Crashlytics pod
        pod 'Crashlytics' # Easily Beta test on multiple devices
2. Fill out main.storyboard
3. Create Data Structure - Post.swift
4. NetworkManager - NetworkManager.swift
5. Create MainViewController.swift implement datasource & delegate methods + update navbar title
6. Create Custom Table View Cell
6. Fill cell with data & Implement dynamic sizing of cells
7. Implement refresh fucntionality (pull down to refresh to conform with apple design guidelines)
8. Test on physical device and older versions of iOS
9. Implement Custom UI Design
10. Archive and upload to Fabric for beta testing
