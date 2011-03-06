##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-01-07 #
# Updated HTTP Server Header match
# Added OS detection
##
# Version 0.2 #
# Updated matches and version detection
##
Plugin.define "ArGoSoft-Mail-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13 
version "0.3"
description "ArGoSoft-Mail-Server web interface - homepage: http://www.argosoft.com/"

# 26 results for GHDB: +intitle:"adding new user" "ArGoSoft Mail Server" +inurl:addnewuser -inurl @ 2010-06-13

# Examples #
examples %w|
www.mecmont.info/addnewuser
www.network-options.net/addnewuser
www.nextwaver.com:8383/addnewuser
vbsca.ca:81/addnewuser
www.chielie.com:8081/addnewuser
inyt.pte.hu:81/addnewuser
mail.bluecreek.k12.mt.us:82/addnewuser
softkiller.ws:85/addnewuser
163.247.50.25/addnewuser
talshiar.adsl.dk:81/addnewuser
www.buchhorn.net:1080/addnewuser
www.mascot.gr:8080/addnewuser
mail.jzstock.com.cn:82/addnewuser
mail.fws.net/addnewuser
|

# Matches #
matches [

	# GHDB Match
	{ :ghdb=>'intitle:"adding new user" "ArGoSoft Mail Server" inurl:addnewuser', :certainty=>75 },

	# Version and OS detection
	{ :version=>/ArGoSoft Mail Server Pro for WinNT\/2000, Version [\d\.]+ \(([\d\.]+)\)<\/p>/, :string=>"OS:Windows NT/2000" },
	{ :version=>/ArGoSoft Mail Server Pro for WinNT\/2000\/XP, Version [\d\.]+ \(([\d\.]+)\)<\/p>/, :string=>"OS:Windows NT/2000/XP" },

]

# Passive #
def passive
	m=[]

	# Version and OS detection # HTTP Header Server text
	if @meta["server"] =~ /ArGoSoft Mail Server Pro for WinNT\/2000, Version [\d\.]+ \(([\d\.]+)\)/
		version=@meta["server"].scan(/ArGoSoft Mail Server Pro for WinNT\/2000, Version [\d\.]+ \(([\d\.]+)\)/)[0][0]
		m << { :version=>version, :string=>"OS:Windows NT/2000" }
	end
	if @meta["server"] =~ /ArGoSoft Mail Server Pro for WinNT\/2000\/XP, Version [\d\.]+ \(([\d\.]+)\)/
		version=@meta["server"].scan(/ArGoSoft Mail Server Pro for WinNT\/2000\/XP, Version [\d\.]+ \(([\d\.]+)\)/)[0][0]
		m << { :version=>version, :string=>"OS:Windows NT/2000/XP" }
	end

	m

end

end

