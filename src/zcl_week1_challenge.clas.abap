CLASS zcl_week1_challenge DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_week1_challenge IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  " SAP Developer Code Challenge – Open-Source ABAP - Week1

  out->write( 'Hello world').
  ENDMETHOD.
ENDCLASS.
