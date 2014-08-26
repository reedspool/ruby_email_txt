# Send a text from the command line.
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
# See http://www.ukrainecalling.com/email-to-text.aspx
# or  http://martinfitzpatrick.name/list-of-email-to-sms-gateways/
# or  http://www.emailtextmessages.com/
# or search the Internet for "email to sms gatways"

require 'gmail'

# CONFIG
USER = {
	email: 'reedmagic@gmail.com',
	pass: '55cA27oG'.reverse # MD-Backwards-Hash
}

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
def send_splash(number, msg)
	GATEWAYS.each do |g|
		basic_email "#{number}@#{g}", msg
	end
end

def basic_email(addr, msg)
	GMAIL.deliver do
		to addr
		text_part { body msg }
	end
end

# RUN IT!

# External gmail pkg protocol
GMAIL = Gmail.new USER[:email], USER[:pass]
GMAIL.login

send_splash ARGV.shift, ARGV.join(' ')