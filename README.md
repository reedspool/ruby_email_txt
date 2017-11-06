# SMS From Terminal

Quick script for sending an SMS to any US number from a computer terminal, via a Gmail account.

## Usage

1) Download script and install gems

        $ git clone https://github.com/reedspool/ruby_email_txt.git;
        $ bundle install;


2) Fill in your e-mail credentials in `config.yml`

3) If you use 2-Factor Auth (You should!), you will need to generate an App Password, and use it in `config.yml`

4) 

        $ ruby send_txt_to.rb 8085553033 "I lost my phone :(";

5) Make a bash alias for easy texting

        $ alias sms_to="ruby send_txt_to.rb ";
        $ sms_to 8085553033 "I lost my phone :(";

6) Check your e-mail inbox for replies!

7) If you use this often, you will want to make a Gmail filter for all the delivery failures. These are normal. See Notes.

## Notes

This script is not fit for production use. It is a toy.

It works by spamming each US SMS gateway for each method without knowledge of which will work. Many "failed delivery" messages will be sent to your inbox with each use because of the naive method.

Requires `gmail` gem. See Gemfile and [gmailgem on Github](https://github.com/gmailgem/gmail).
