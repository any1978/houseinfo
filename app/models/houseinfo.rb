class Houseinfo < ApplicationRecord
    has_many :nearstations,  dependent: :destroy
    accepts_nested_attributes_for :nearstations, reject_if: :reject_both_blank, allow_destroy: true

    def reject_both_blank(attributes)
        if attributes[:id]
          attributes.merge!(_destroy: "1") if attributes[:routename].blank? and attributes[:station].blank? and attributes[:minutes].blank?
          !attributes[:routename].blank? and attributes[:station].blank? and attributes[:minutes].blank?
        else
          attributes[:routename].blank? and attributes[:station].blank? and attributes[:minutes].blank?
        end
    end

    validates :name, presence: true
    validates :rent, presence: true
    validates :address, presence: true
    validates :age, presence: true
    validates :note, presence: true

end
