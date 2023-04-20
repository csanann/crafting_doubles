=begin
#file: crafting_doubles.rb

#create a simpe double without any methods or behaviour using....belows..to create the double
double(:fake_object)

#create a double with a specific methods and their return values using..belows..to define the methods and their return values
double(:fake_object, method_name: return_value)

#create a double with methods that take arguments and return specific values only for given arguments by using..
#..belows..to define the method with argument and return value
allow(fake_object).to receive(:method_name).with(argument).and_return(return_value)

#create a double with a method that expects to called with a specific argument 
#use ..belows..to set the expectation
expect(fake_object).to receive(:method_name).with(argument)

#create a doble for a specific case:

challenge: create a complex double (more complex behavior and multiple methods)
=end
RSpec.describe "doubles" do
    it "sets up a blank double" do
        fake_object = double(:fake_object)

        expect(fake_object).to be
    end

    it "sets up a double with methods" do
        fake_object = double(:fake_object, speak: "Meow", count_ears: 2, count_legs: 4)

        expect(fake_object.speak).to eq "Meow"
        expect(fake_object.count_ears).to eq 2
        expect(fake_object.count_legs).to eq 4
    end

    it "sets up a double with methods that take arguments" do
        fake_object = double(:fake_object)
        allow(fake_object).to receive(:speak).with("Jess").and_return("Meow, Jess")

        expect(fake_object.speak("Jess")).to eq "Meow, Jess"
        expect { fake_object.speak("Ron") }.to raise_error RSpec::Mocks::MockExpectationError
    end

    it "creates a double for a specific case" do
        fake_object = double(:diary, add: nil)
        allow(fake_object).to receive(:count_entries).and_return(2)

        fake_object.add(double :diary_entry)
        fake_object.add(double :diary_entry)
        expect(fake_object.count_entries).to eq 2
    end
end