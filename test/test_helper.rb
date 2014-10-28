require 'simplecov'
SimpleCov.start
SimpleCov.add_filter '/test/'
require 'minitest/autorun'
require_relative '../read_req'


def generate_test_case(count_idx = 0)
    { 
        "Count" => count_idx,
        "Key" => OpenSSL::Random::random_bytes(16).unpack('H*').first,
        "IV"  => OpenSSL::Random::random_bytes(12).unpack('H*').first,
        "CT" => OpenSSL::Random::random_bytes(16).unpack('H*').first,
        "AAD" => OpenSSL::Random::random_bytes(16).unpack('H*').first,
        "Tag" => OpenSSL::Random::random_bytes(16).unpack('H*').first
    }
end


# fields should be random and maybe related with generate_entry_dataa
def generate_parameters
    {
        "Keylen" => 128,
        "IVlen" => 96,
        "PTlen" => 0,
        "AADlen" => 0,
        "Taglen" => 128
    }
end
