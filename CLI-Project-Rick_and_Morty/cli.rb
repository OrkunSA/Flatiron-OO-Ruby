require_relative './rick'
require_relative './rick_api'
require 'awesome_print'

class CLI
    def run 
        puts "enter a name"
        name = gets.chomp
        RickApi.get_ricks(name)
        main
    end

    def main 
        print_names
        prompt_selection
        selection = get_selection
        rick = find_rick(selection)
        print_details(rick)
        again?
    end

    def prompt_selection
        puts "Enter a Rick number for more information!"
    end

    def get_selection
        selection = gets.chomp
        selection.to_i - 1
    end

    def find_rick(index)
        Rick.find_by_index(index)
    end

    def print_details(rick)
        puts "Name: #{rick.name}"
        puts "Status: #{rick.status}"
        puts "Origin: #{rick.origin}"
    end

    def again?
        puts "explore more Ricks? (y/n)"
        choice = gets.chomp
        if choice == "y"
            main
        else
            exit
        end
    end



    def print_names
        Rick.all_names.each.with_index(1) {|name, i| puts "#{i}. #{name}"}
    end

end

CLI.new.run