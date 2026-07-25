CLASS zcl_mss_hr_employee_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcl_mss_hr_employee_08 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_employee TYPE STANDARD TABLE OF zhr_employee.

    SELECT *
      FROM zhr_employee
      INTO TABLE @lt_employee.

    out->write( |INICIO.| ).

    IF lt_employee IS INITIAL.
      out->write( |No employee data found.| ).
      RETURN.
    ENDIF.

    LOOP AT lt_employee ASSIGNING FIELD-SYMBOL(<emp>)
      GROUP BY ( key = <emp>-department size = GROUP SIZE ) INTO DATA(grp).

      DATA(lv_count) = grp-size.
      DATA(lv_sum) = REDUCE decfloat16(
        INIT total = 0
        FOR m IN GROUP grp
        NEXT total = total + CONV decfloat16( m-used_leave_days )
      ).
      DATA(lv_avg) = COND decfloat16(
        WHEN lv_count GT 0 THEN lv_sum / CONV decfloat16( lv_count )
        ELSE 0
      ).

      out->write( |Department: { grp-key }, Employees: { lv_count }, Avg Used Leave Days: { lv_avg }| ).
    ENDLOOP.

    out->write( |FIN.| ).

  ENDMETHOD.



ENDCLASS.
