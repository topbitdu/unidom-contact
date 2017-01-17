##
# Email Address 是电子邮箱地址。

class Unidom::Contact::EmailAddress < Unidom::Contact::ApplicationRecord

  self.table_name = 'unidom_email_addresses'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Contact::Concerns::AsContact

  validates :personalized_name, presence: true, length: { in: 1..self.columns_hash['personalized_name'].limit }
  validates :full_address,      presence: true, length: { in: 4..self.columns_hash['full_address'].limit      }, uniqueness: true
  validates :local_part,        presence: true, length: { in: 1..self.columns_hash['local_part'].limit        }
  validates :domain_part,       presence: true, length: { in: 2..self.columns_hash['domain_part'].limit       }

  scope :full_address_is, ->(full_address) { where full_address: full_address }
  scope :local_part_is,   ->(local_part)   { where local_part:   local_part   }
  scope :domain_part_is,  ->(domain_part)  { where domain_part:  domain_part  }

  before_validation do
    self.full_address.strip!
    self.personalized_name = self.full_address if self.personalized_name.blank?
    self.full_address.downcase!
    self.local_part, self.domain_part = self.full_address.split '@', 2
  end

  # http://blog.csdn.net/wide288/article/details/20782399
=begin
  /**
  Validate an email address.
  Provide email address (raw input)
  Returns true if the email address has the email
  address format and the domain exists.
  */
  function validEmail($email)
  {
     $isValid = true;
     $atIndex = strrpos($email, "@");
     if (is_bool($atIndex) && !$atIndex)
     {
        $isValid = false;
     }
     else
     {
        $domain = substr($email, $atIndex+1);
        $local = substr($email, 0, $atIndex);
        $localLen = strlen($local);
        $domainLen = strlen($domain);
        if ($localLen < 1 || $localLen > 64)
        {
           // local part length exceeded
           $isValid = false;
        }
        else if ($domainLen < 1 || $domainLen > 255)
        {
           // domain part length exceeded
           $isValid = false;
        }
        else if ($local[0] == '.' || $local[$localLen-1] == '.')
        {
           // local part starts or ends with '.'
           $isValid = false;
        }
        else if (preg_match('/\\.\\./', $local))
        {
           // local part has two consecutive dots
           $isValid = false;
        }
        else if (!preg_match('/^[A-Za-z0-9\\-\\.]+$/', $domain))
        {
           // character not valid in domain part
           $isValid = false;
        }
        else if (preg_match('/\\.\\./', $domain))
        {
           // domain part has two consecutive dots
           $isValid = false;
        }
        else if (!preg_match('/^(\\\\.|[A-Za-z0-9!#%&`_=\\/$\'*+?^{}|~.-])+$/',
                   str_replace("\\\\","",$local)))
        {
           // character not valid in local part unless
           // local part is quoted
           if (!preg_match('/^"(\\\\"|[^"])+"$/',
               str_replace("\\\\","",$local)))
           {
              $isValid = false;
           }
        }
        if ($isValid && !(checkdnsrr($domain,"MX") || checkdnsrr($domain,"A")))
        {
           // domain not found in DNS
           $isValid = false;
        }
     }
     return $isValid;
  }
=end

end unless Unidom::Common::Neglection.namespace_neglected? 'Unidom::Contact::EmailAddress'
