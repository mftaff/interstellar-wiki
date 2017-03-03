module RandomData
    @@space_words = "albedo Alpha_Centauri apastron aperature aphelion apogee asterism asteroid astronaut astronomer astronomical_unit astronomy axial_tilt azimuth background_radiation Bailey's_beads big_bang_theory binary_star black_body black_hole bolometer celestial celestial_equator cislunar cluster comet conjunction constellation coriolis force cosmic_rays corona cosmology cosmonaut cosmos crater crescent_moon dark_matter day declination deep_space Deneb density docking Doppler_shift double_star Drake_equation dust dwarf_planet dwarf_star Earth earthbound eccentricity eclipse ecliptic elliptical_orbit equinox escape_velocity event_horizon exoplanet extragalaxtic falling_star flare flyby free_fall full_moon galaxy gamma ray gas giant gegenschein geostationary geosynchronous gibbous_moon globular_cluster gravitation gravitational_constant gravitational_lens gravity half_moon heliocentric hydrogen helium H-R_diagram Hubble_telescope Hubble's_law hyperbolic_orbit hypernova ice_giant inclination inertia inferior_planets inner planets interstellar interstellar_dust ionosphere Jupiter Kepler's_laws kiloparsec Kirkwood gaps Kuiper_belt Lagrange_points lens light-year local_arm local_group lunar magnitude mare Mars mass Mercury meteor meteor_shower meteorite meteoroid Milky_Way minor_planet Mir moon muttnik nadir NASA nebula Neptune neutron_star new_moon north_star nova observatory occultation Oort_cloud opposition orbit orbital_eccentricity orbital_inclination outer_planets parallax parsec partial_eclipse penumbra perigee perihelion perturbation phase plane_of_the_ecliptic planet planetary_nebula planetoid Pluto pole_star precession probe pulsar quarter_moon quasar radiant radiation red_dwarf red_giant star red_shift revolve right_ascension rings Roche_limit rocket satellite Saturn scientific_notation scintillation shooting_star solar sidereal singularity sky solar solar_system solar_wind solstice space space_exploration space_station spectroscope S_cont. spectrum Sputnik star starlight sun sunspot superior_planets supernova synodic syzygy telemetry telescope terminator terrestrial total_eclipse totality transit translunar transneptunians travel twinkling umbra universe Uranus vacuum Van_Allen_belt variable star Venus vernal_equinox visual_magnitude waning wavelength waxing weightlessness white_dwarf white_giant wormhole x-rays yellow_dwarf zenith zodiac".split(' ').map{|w| (w.include? '_') ? w.gsub!('_', ' ') : w}
    @@grammer_words = "though although even though while if only if unless until provided that assuming that even if lest than rather than whether as_much_as whereas after as_long_as as_soon_as before by_the_time now_that once since till until when whenever while because since so that why that what whatever which whichever who whoever whom whomever whose how as though as if where wherever it and or but maybe I he her she him them they also besides furthermore likewise moreover however nevertheless nonetheless still conversely instead otherwise rather accordingly consequently hence meanwhile then therefore thus".split(' ').map{|w| (w.include? '_') ? w.gsub!('_', ' ') : w}
    @@names = "Rodney Drozd  Dyan Kinkead  Patria Ropp  Nicolette Wozniak  Peter Erb  Prudence Jent  Paola Cazarez  Lorenzo Meeker  Ardath Balke  Nichol Kuhlmann  Tawna Mcdole  Faviola Kaminsky  Kimberlie Ney  Genna Zweifel  Loan Greenwald  Nakita Munsey  Danica Dials  Stephan Ricken  Tandra Torres".split(' ')
    
    def self.random_space_name
        "#{@@names.sample} #{@@names.sample}"
    end
    
    def self.random_space_email
        "#{@@names.sample}@#{(@@space_words.sample).gsub(" ", "")}.#{(@@space_words.sample).gsub(" ", "")}"
    end
    
    def self.random_space_sentence
        strings = []
        rand(3..7).times do
            (rand(1..5) < 4) ? (strings << @@grammer_words.sample) : (strings << @@space_words.sample)
        end
        (strings.join(" ") << ".").capitalize
    end
    
    def self.random_space_paragraph
        sentences = []
        rand(4..6).times do
            sentences << random_space_sentence
        end
    
        sentences.join(" ")
    end
end
