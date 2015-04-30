
require 'spec_helper'
require_relative "../cipher.rb"

describe "Cipher function" do
    context "when the input is not letters" do
        it "returns the original string" do
            no_letters = "8765 !$"
            new_string = caesar_cipher(no_letters, 10)
            expect(new_string).to eql(no_letters)
        end
    end

    context "when all letters" do
        it "returns a rotated string" do
            string = "hellothere"
            new_string = caesar_cipher(string, 3)
            expect(new_string).not_to eql(string)
            expect(new_string).to eql("khoorwkhuh")
        end
    end

    context "when punctuation or spaces" do
        it "returns the original string" do
            string = "^ ? . ; &"
            new_string = caesar_cipher(string, 5)
            expect(new_string).to eql(string)
        end
    end

    context "when uppercase letters with lowercase" do
        it "maintains case of letters" do
            string = "aABc"
            new_string = caesar_cipher(string, 4)
            expect(new_string).to eql("eEFg")
        end
    end

    context "when rotation goes past 'z' " do
        it "wraps back to the beginning of the alphabet" do
            string = "xYZ"
            new_string = caesar_cipher(string, 5)
            expect(new_string).to eql("cDE")
        end
    end

    context "when contains numbers, punctuation, upper and lower case" do
        it "returns string, maintaining case, and leaving punctuation and numbers alone" do
            string = "12 Hello. &9"
            new_string = caesar_cipher(string, 5)
            expect(new_string).to eql("12 Mjqqt. &9")
        end
    end
end