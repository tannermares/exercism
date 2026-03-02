class LocomotiveEngineer
  def self.generate_list_of_wagons(*args)
    return args
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    wag1, wag2, wag3, *rest = each_wagons_id
    [wag3, *missing_wagons, *rest, wag1, wag2]
  end

  def self.add_missing_stops(hash, **kwargs)
    { **hash, stops: kwargs.values }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
