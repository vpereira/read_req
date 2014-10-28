require 'test_helper'


describe Section do
    before do
        @section = Section.new 
        0.upto(10) do |i|
            @section.parameters =  generate_parameters
            @section.cases = generate_test_case
        end
    end

    it { @section.wont_be_nil }
    it { @section.parameters.wont_be_nil }
    it { @section.cases.wont_be_nil }
end

describe ReqFile do
    before do
        @req = ReqFile.new('./test/sample_data1.txt')
        @req.parse
    end
    it { @req.wont_be_nil }
    
    it { @req.sections.must_be_kind_of Array }

    it { @req.sections.wont_be_empty }

    it { @req.sections.first.parameters["Keylen"].must_equal "128" }
    it { @req.sections.first.parameters["IVlen"].must_equal "96" }
    it { @req.sections.first.cases["Count"].must_equal "14" }
    it { @req.sections.first.cases["Tag"].must_equal "93418" }
    it { @req.sections.last.cases["Key"].must_equal "944" }
end
