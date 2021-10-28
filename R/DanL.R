DanL <- function(){
require(magick)
  tiger <- image_read('AkikR/images/Picture1.png')

  tiger %>%
    image_scale("350x") %>%
    image_quantize(128) %>%
    image_annotate(., "All the best Akika",
                   size = 11,
                   color = "black",
                   location = "+60+250",
                   font = 'Times') %>%

    image_annotate(., "Thank you for all your meticulous work in DnA / DCM.",
                   size = 11,
                   color = "black",
                   location = "+20+275",
                   font = 'Times') %>%

    image_annotate(., "I have enjoyed working with you, and learning from you ",
                   size = 11,
                   color = "black",
                   location = "+10+300",
                   font = 'Times') %>%

    image_annotate(., "on a number of different projects.",
                   size = 11,
                   color = "black",
                   location = "+30+315",
                   font = 'Times') %>%

    image_annotate(., "I hope you'll continue to solve my many R problems in the user group!!",
                   size = 11,
                   color = "black",
                   location = "+10+340",
                   font = 'Times') %>%

    image_annotate(., "DanL",
                   size = 11,
                   color = "black",
                   location = "+15+360",
                   font = 'Times')

}
