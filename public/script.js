$(document).ready(function() {

  $(".extend_ing").click(function() {
      $(".starting_ing").append("<div class='col-sm-3'>" +
                                  "<input placeholder='amount' name='unit_amount[]'>" +
                                "</div>" +
                                "<div class='col-sm-6'>" +
                                  "<input name='ingredient[]'>" +
                                  "<label class='starting_ing' for='ingredient[]'>Ingredient</label>"
                                "</div>");

    });

  $(".extend_instr").click(function() {
      $(".starting_instr").append("<input class='validate' type='text' name='instruction[]'>" +
                                  "<label class='starting_instr' for='instruction[]'>Instruction</label>");
    });

  $(".extend_tag").click(function() {
      $(".starting_tag").append("<input class='validate' type='text' name='tag[]'>" +
                                "<label class='starting_tag' for='tag[]'>Tag</label>");
    });
});
