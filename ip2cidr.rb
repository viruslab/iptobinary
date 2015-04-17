ip_list = []
string = "1"
ip_number = 1
flag = 0

#converts and IP address to binary
def ip2binary(ip_string)
	a = "" 
	ip_string = ip_string.split(".")
	ip_string.each {|x| a << "%08b." % x.to_i}
	return a
end


def checkifvalid(ip_string)
	index = 0
	flag = 0
	count = ip_string.count "."

	if count == 3

		ip_string = ip_string.split(".")
		
		while index < 4
			if ip_string[index].to_i >= 255
				flag += 1
			end
			index += 1
		end

		if flag == 0 
			return 1
		end
	end
	
	return 0
end



puts "please enter IP addresses below. '0' to terminate "

while string.to_i != 0 
	print "IP Address number #{ip_number}: "
	STDOUT.flush 
	
	string = gets.chomp
	flag = checkifvalid(string)
	if flag == 0
		print "The IP Address is either invalid or reserved \n"

	else
	ip_list << ip2binary(string)[0...-1]
	ip_number += 1
	string = "1"
	end

end

print ip_list