/**
 * Manages JS-Enhanced search form
 * @module LiftSearchForm
 */
(function ($) {
  "use strict";
  var toggleExpanded = function() {
    $(this).parent('ul').toggleClass('expanded');
  };

  $('.no-js').removeClass('no-js');

  $('.lift-filter-expand, .lift-filter-collapse').on('click', toggleExpanded);

})(jQuery);