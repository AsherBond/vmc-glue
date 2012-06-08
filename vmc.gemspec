# -*- encoding: utf-8 -*-
vmc = Dir.chdir(File.expand_path("../vmc", __FILE__)) do
  Gem::Specification.load("vmc.gemspec")
end

vmc_ng = Dir.chdir(File.expand_path("../vmc-ng", __FILE__)) do
  Gem::Specification.load("vmc.gemspec")
end

unless vmc
  raise "vmc gemspec not found!"
end

unless vmc_ng
  raise "vmc_ng gemspec not found!"
end

Gem::Specification.new do |s|
  s.name        = "vmc"
  s.version     = vmc_ng.version
  s.author      = vmc.author
  s.email       = vmc.email
  s.homepage    = vmc.homepage
  s.summary     = vmc.summary
  s.executables = %w{vmc}

  s.require_paths = ["vmc/lib"]

  s.files =
    vmc.files.collect { |f|
      "vmc/#{f}"
    } + vmc_ng.files.collect { |f|
      "vmc-ng/#{f}"
    }

  [vmc, vmc_ng].each do |g|
    g.dependencies.each do |dep|
      s.add_runtime_dependency dep.name, *(dep.requirement.to_s.split(", "))
    end
  end
end
