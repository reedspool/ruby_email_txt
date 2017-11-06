# Send a text from the command line.
#
# Dependencies:
# 	gmail gem
#
# Author: Reed Spool
# 
# ex.
# 
# >   ruby send_txt_to.rb 8085553033 "<3 U bb"
#
# Update CONFIG area, with YOUR email and password
# 
# Might need to update GATEWAYS
# 
# See http://www.ukrainecalling.com/email-to-text.aspx
#     http://martinfitzpatrick.name/list-of-email-to-sms-gateways/
#     http://www.emailtextmessages.com/
#     
#     or search the Internet for "email to sms gatways"

require 'gmail'
require 'yaml'

CONFIG = YAML.load_file('config.yml')

GATEWAYS = [
	'message.alltel.com',
	'txt.att.net',
	'cingularme.com',
	'myboostmobile.com',
	'messaging.nextel.com',
	'messaging.sprintpcs.com',
	'tmomail.net',
	'email.uscc.net',
	'vtext.com',
	'vmobl.com'
]

# UTILITIES
def send_splash(gmail, number, msg)
	GATEWAYS.each do |g|
		basic_email gmail, "#{number}@#{g}", msg
	end
end

def basic_email(gmail, addr, msg)
	gmail.deliver do
		to addr
		text_part do
		  body msg
		end
	end
end

# RUN IT!
Gmail.connect!(CONFIG["email"], CONFIG["pass"]) do |gmail|
	send_splash gmail, ARGV.shift, ARGV.join(' ')
end
