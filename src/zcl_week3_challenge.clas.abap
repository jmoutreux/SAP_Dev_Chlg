CLASS zcl_week3_challenge DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   types:
    BEGIN OF ty_shop_item,
    name TYPE string,
    price(15) TYPE p DECIMALS 2,
   END OF ty_shop_item .
  types:
    ty_shop_item_tt TYPE TABLE OF ty_shop_item WITH DEFAULT KEY .
  types:
    BEGIN OF ty_shop,
     shop_name TYPE string,
     items     TYPE ty_shop_item_tt,
    END OF ty_shop .

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_week3_challenge IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA lo_mustache TYPE REF TO zcl_mustache.
    DATA lt_my_data TYPE STANDARD TABLE OF ty_shop WITH DEFAULT KEY.
    DATA lr_data TYPE REF TO ty_shop.
    DATA: cx TYPE REF TO zcx_mustache_error.

    APPEND INITIAL LINE TO lt_my_data REFERENCE INTO lr_data.
    lr_data->shop_name = 'Magasin Jéjésap'.
    lr_data->items = VALUE ty_shop_item_tt( ( name = 'Code EHP5 compatible' price = '19.00' )
                                            ( name = 'Pas d''Inline declaration ' price = '49.00' )
                                            ( name = 'No Changing with returning' price = '199.00' ) ).




    try.
       lo_mustache = zcl_mustache=>create(
      'Bienvenue au  {{shop_name}}' && cl_abap_char_utilities=>newline &&
      '{{#items }}'             && cl_abap_char_utilities=>newline &&
      '* {{name}} - {{price}}€'  && cl_abap_char_utilities=>newline &&
      '{{/items}}' && cl_abap_char_utilities=>newline ).
          out->write( lo_mustache->render( lt_my_data ) ).
      catch zcx_mustache_error into cx.
          out->write( 'Error raised' ).
    endtry.


  ENDMETHOD.
ENDCLASS.
