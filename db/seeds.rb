# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# notes: Check how to declare polymorphic associations in creating objects
# what about jackets that don't even have a waist associated with it, like a cape

Product.delete_all
User.delete_all

Product.create(name: "Vintage 1950s Suit", gender: "female" , url: "https://www.etsy.com/listing/268532087/vintage-1950s-suit-red-and-black-50s?ref=shop_home_active_1")
#sub-name: "Red and Black 50s Suit with Peplum"
#size: Medium
#description: "This suit is totally classy! The black rayon has very thin red striped woven through. The jacket has a V neckline and a collar trimmed with bows. It buttons down the waist with fabric covered buttons (the bottom button is faked with a hook behind it. There is a lightly flare peplum trimmed with an extra flap in back, with even more bows! The front of the jacket is fitted with normal darts, but the back has a fascinating horizontal curved seam for fit. The skirt is a classic straight silhouette with a vertical tuck down the front, and a kick pleat in back. It fastens with a side metal zipper and button. This suit is in excellent vintage condition, with no holes, stains, odors to note. It has been pinned on model to show fit."
#price: 110.00
#tags: "Clothing", "Women's Clothing", "Suits", "Black 50s suit", "Red 1950's suit", "peplum", "pencil skirt", "black and red", "Overattired", "Medium Med M", "Rayon suit", "1940's 40's", "Striped suit", "V neck", "business suit", "kick pleat"

Measurement.create(measurable_type: Product, measurable_id: 1, gender: "female", hip: 41, waist: 29, bust: 38)
# Jacket
# Bust: 38
# Waist: 29
# Overall Length: 23

# Skirt
# Waist: 28
# Hips: 41
# Length: 27

Product.create(name: "Vintage 1950's Skirt", gender: "female" , url: "https://www.etsy.com/listing/268527485/vintage-1950s-skirt-pleated-and-striped?ref=shop_home_active_2" )
#sub-name: Pleated and Striped 50s Wool Skirt
#size: "small"
#price: 50.00
#description: "This wool skirt features a great variety of lovely colors! It is pleated from the waist, and vertically striped in Forest Green, Navy Blue, Royal Purple and Yellow! The flattering wide waistband has buttonhole style belt loops. The skirt fastens with a metal zipper and two buttons.This skirt is in excellent vintage condition, with no holes, stains, odors to note."
#tags: "Clothing", "Women's Clothing", "Skirts", "Striped 50s Skirt", "Pleated 1950's Skirt", "Forest Green", "Navy Blue", "Royal Purple", "Yellow", "Vertical stripes", "Wool skirt", "Midi Skirt", "Overattired", "Small Sm S", "Pleats", "Blue Grey"

Measurement.create(measurable_type: Product, measurable_id: 2, gender: "female", hip: , waist: 26, bust: )
# Waist: 26
# Hips: free
# Overall Length: 30

Product.create(name: "Vintage 1950s Jacket", gender: "female" , url: "https://www.etsy.com/listing/268629438/vintage-1950s-jacket-black-50s-western?ref=shop_home_active_4")
#sub-name: "Black 50s Western Blazer"
#size: "Medium Large"
#price: 55.00
#description: "This black jacket is a wardrobe staple with just enough charming details to keep it interesting! Made of a soft true black wool and only very lightly padded at the shoulders, it is also fully lined. The jacket has a sweet curved notched collar and real pockets, both of which are decorated with a western style curved appliqué. It fastens in front with 4 fabric covered buttons, and even has an extra button inside just in case! The long sleeves have a small turned up cuff. This jacket is in good vintage condition, with no holes, stains, odors to note. It has been pinned on model to show fit."
#tags: "Clothing", "Women's Clothing", "Jackets & Coats", "Black wool jacket", "50s coat", "1950s blazer", "western vintage", "Overattired", "Large Lg L", "Medium Med M", "covered buttons", "business jacket", "suit jacket", "pockets", "tailored coat", "1940s 40s"

Measurement.create(measurable_type: Product, measurable_id: 3, gender: "female", hip: , waist: 34, bust: 40)
# Bust: 40
# Waist: 34
# Overall Length: 23
# Sleeve Length: 23.5

Product.create(name: "Vintage 1950s Jacket", gender: "female", url: "https://www.etsy.com/listing/268514567/vintage-1950s-jacket-mulberry-wool?ref=shop_home_active_6")
# sub-name: "Mulberry Wool Tailored Blazer"
# size: "Extra Small"
# description: "This mulberry wool tailored jacket is just stunning! It is made of a soft wool gabardine, and the photos don't quite do the color justice- it is squarely in between royal purple and maroon- a true jewel tone! It is fitted with princess seams and has light padding in the hips to reinforce that hourglass silhouette. The shoulders are also lightly padded. The deep neckline has a wide shawl collar, and the jacket fastens slightly asymmetrically with two black buttons. The label inside is from Craig's in Houston. The jacket is fully lined with raspberry silk crepe. This jacket is in excellent vintage condition, with no holes, stains, odors to note."
# tags: "Clothing", "Women's Clothing", "Jackets & Coats", "Red 50s Jacket", "Mulberry 1950s coat", "Purple blazer", "Maroon suit jacket", "Hourglass", "Overattired", "Extra Small XS", "Wool jacket", "1940s 40s", "Shawl collar", "V neckline", "Tailored jacket", "Jewel tone"

Measurement.create(measurable_type: Product, measurable_id: 4, gender: "female", hip: , waist: 25, bust: 35)
# Bust: 35
# Waist: 25
# Overall Length: 21.5
# Sleeve Length: 23

Product.create(name: "Vintage 1960s Dress", gender: "female", url: "https://www.etsy.com/listing/267581417/vintage-1960s-dress-black-jersey-belted?ref=shop_home_active_3" )
# sub-name: "Black Jersey Belted Dress"
# size: "Small"
# price: 55.00
# description: "Great little black dress by Catalina! Slightly stretchy jersey knit in inky black. Long sleeved and pencil fit skirt. Matching let included. Nylon zipper up the back. This dress is in excellent vintage condition, with no holes, stains, odors to note."
# tags: "Clothing", "Women's Clothing", "Dresses", "1960s dress", "belted jersey dress", "long sleeved dress", "belt dress", "60s catalina", "Overattired", "small sm s", "inky black", "knit dress", "fitted dress", "pencil dress"

Measurement.create(measurable_type: Product, measurable_id: 5, gender: "female", hip: 36, waist: 27, bust: 37)
# *****NOTE: measurements are in a range, so we have to somehow account for that in the database
# Shoulders: 15
# Bust: 37 to 41 
# Waist: belt fits up to 27 
# Hips: 36 to 42
# Overall Length: 37 
# Sleeve Length: 23.5

Product.create(name: "Vintage 1950s dress", gender: "female", url: "https://www.etsy.com/listing/268485785/vintage-1950s-dress-green-and-purple?ref=shop_home_active_7" )
# sub-name: "Green and Purple Paisley 50s Shirtwaist Dress"
# size: "Extra Large"
# price: 55.00
# text-description: "This great paisley shirtwaist dress is was made by Palm Fashion of 100% Dacron Polyester. It is a great example of 50s permanent press technology- the knife pleats in the skirt are just as precise as when it was made, and the fabric won't even think about wrinkling! The fabric is slightly sheer when held up to the light, so wearing a slip underneath would be advisable. It fastens with pearlescent grey buttons down the front and one hook at the waist. Belt is shown for inspiration only and is not included.
# There is a little bit of pilling throughout the dress, but it is still in great wearable vintage condition, and has been priced accordingly. There are no holes, stains, odors to note. It has been belted on model to show fit."
# tags: "Clothing", "Women's Clothing", "Dresses", "Paisley 50s dress", "Green 1950s Dress", "Purple and green", "Extra Large XL", "shirtwaist dress", "short sleeved dress", "Dacron", "1960s 60s", "Fit and flare", "Overattired", "pleated skirt", "button up dress", "collared dress"

Measurement.create(measurable_type: Product, measurable_id: 6, gender: "female", hip: , waist: 33, bust: 44)
# Bust: 44
# Waist: 33
# Hips: free
# Overall Length: 44


Product.create(name: "Vintage 1950s Mens Suit", gender: "male", url: "https://www.etsy.com/listing/268235639/vintage-1950s-mens-suit-brown-striped?ref=shop_home_active_18")
# sub-name: "Brown Striped 50s Two Piece Suit"
# size: 40
# price: 225.00
# description: "This 50s two piece suit by Fieldshire is made of tone on tone striped fabric with a great mid-century look! The single breasted narrow lapel jacket closes with two buttons and has a single vent at back. The lower outside pockets are welted and have an optional pocket flap. The trousers have a flat front, close with a metal zipper fly, and are cuffed. This suit is in excellent vintage condition with no holes, stains, or odors to note."
# tags: "clothing", "Men's Clothing", "Suits & Sport Coats", "Suits", "overattired", "vintage menswear", "brown 50s suit", "striped 1950s suit", "single breasted suit", "s small med medium m", "36 waist", "brown two piece suit", "fleck 2 piece suit", "Maroon suit", "brown suit jacket", "atomic suit"

Measurement.create(measurable_type: Product, measurable_id: 7, gender: "male", waist: 36, chest: 43, inseam: 30)
# Jacket
# Chest: 43”
# Shoulders: 18” 
# Sleeves: 25.5”
# Length: 31.5”

# Trousers
# Waist: 36”
# Inseam: 30” (plus another 3" to let out)

Product.create(name: "Vintage 1930s Style Mens Suit", gender: "male", url: "https://www.etsy.com/listing/268332362/vintage-1930s-style-mens-suit-brown-and?ref=shop_home_active_19")
# sub-name:  "Brown and Blue Tweed Belted Back Suit"
# size: 42
# price 250.00
# description: "This fantastic single breasted suit is made in a 1930s Belted Back style with box pleated flap pockets of a brown and blue tweed wool with an intricate pattern. The belted back has a western style yoke and a single center box pleat above the belt with a single vent below.
# The flat front pants have no cuffs, and a slight flare. 
# This Suit is in excellent vintage condition, with no holes, stains, odors to note.
# "
# tags: "Clothing", "Men's Clothing", "Suits & Sports Coats", "Suits", "overattired", "1930s suit", "1970s suit", "belted back", "belt back jacket", "brown wool suit", "Size 42", "vintage menswear", "small s medium med m", "2 piece suit", "70s-does-30s", "tweed 70s suit", "western suit"

Measurement.create(measurable_type: Product, measurable_id: 8, gender: "male", waist: 33, chest: 45, inseam: 28)
# Chest: 45
# Shoulders: 18
# Sleeves: 24
# Jacket Length: 30
# Waist: 33 (plus another 2 to let out)
# Inseam: 28 (plus another 1.5 to let out)

Product.create(name: "Vintage 1940s Mens Suit", gender: "male", url: "https://www.etsy.com/listing/268234425/vintage-1940s-mens-suit-blue-peak-lapel?ref=related-0" )
# sub-name: "Blue Peak Lapel 40s Suit"
# size: 40
# price: 225.00
# description: "Can you imagine a more classic 1940s suit? The true blue wool and giant peaked lapels are just perfect! The suit is made by Siegel's of San Francisco from a smooth wool twill. The double breasted jacket has 6 outer buttons. Two are functional, and there is an extra keeper button on the inside of the jacket. The two lower jacket pockets are welted, and the pocket on the right has an additional smaller pocket inside! The back is unvented. The Hollywood waist trousers have front pleats and dropped belt loops. The back left pocket has a great pointed button tab, and the trousers are cuffed. Please note: The blue color is vibrant and true throughout the suit, with no fading. Our lights reflected off this to create the apparent fade in some photos. This suit is in excellent vintage condition with no holes, stains, or odors to note."
# tags: "Clothing", "Men's Clothing", "Suits & Sports Coats", "Suits", "True blue suit", "blue 1940s suit", "40s double breasted", "peaked lapels", "hollywood waist", "dropped loop", "overattired", "vintage menswear", "small sm s", "WWII suit", "two piece suit", "blue 2 piece suit", "42"


Measurement.create(measurable_type: Product, measurable_id: 9, gender: "male" , waist: 29, chest: 42, inseam: 31)
# Jacket
# Chest: 42”
# Shoulders: 19” 
# Sleeves: 25”
# Length: 29”

# Trousers
# Waist: 29” (plus another 3" to let out)
# Inseam: 31” (plus another 3" to let out)


User.create(first_name: "Lindsey", last_name: "Stevens", email: "lindsey@gmail.com", password: "12345678", gender: "female")
Measurement.create(measurable_type: User, measurable_id: 1, gender: "female", hip: 36, waist: 25, bust: 35)


User.create(first_name: "Hanah", last_name: "Yen", email: "hanah@gmail.com", password: "12345678", gender: "female")
Measurement.create(measurable_type: User, measurable_id: 2, gender: "female", hip: 42, waist: 33, bust: 40)


User.create(first_name: "Ovi", last_name: "Calvin", email: "ovi@gmail.com", password: "12345678", gender: "male")
Measurement.create(measurable_type: User, measurable_id: 3, gender: "male" , waist: 30, chest: 42, inseam: 31)

User.create(first_name: "Stuart", last_name: "Ed", email: "stuart@gmail.com", password: "12345678", gender: "male")

Measurement.create(measurable_type: User, measurable_id: 4, gender: "male" , waist: 33, chest: 43, inseam: 29)


