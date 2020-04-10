module HouseinfosHelper
    def choose_new_or_edit
        if action_name == 'new'
          houseinfos_path
        elsif action_name == 'edit'
          houseinfo_path
        end
    end
end

# def choose_new_or_edit
#   if action_name == 'new'
#     houseinfos_path
#   elsif action_name == 'edit'
#     houseinfos_path
#   end
# end