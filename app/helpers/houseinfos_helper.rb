module HouseinfosHelper
    def choose_new_or_edit
        if action_name == 'new'
          confirm_houseinfos_path
        elsif action_name == 'edit'
          houseinfo_path
        end
      end
end

