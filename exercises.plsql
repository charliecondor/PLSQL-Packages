SET SERVEROUTPUT ON;

/* global block start */
DECLARE
   g_num1 NUMBER;
   g_num2 NUMBER;
   g_result NUMBER;
   v_random_number NUMBER;

/* printOut procedure definition */
PROCEDURE printOut(
    p_message IN VARCHAR2)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE(p_message);
END printOut;

/* findMax function definiton */
FUNCTION findMax(
    p_num1 IN NUMBER,
    p_num2 IN NUMBER)
RETURN NUMBER
IS 
    v_result NUMBER; 
BEGIN 
   IF p_num1 > p_num2 THEN
      v_result := p_num1;
   ELSE
      v_result := p_num2;
   END IF;
   RETURN v_result;
END;

/* findMin function definition */
FUNCTION findMin(
    p_num1 IN NUMBER,
    p_num2 IN NUMBER)
RETURN NUMBER
IS
    v_result NUMBER;
BEGIN 
   IF p_num1 < p_num2 THEN
      v_result := p_num1;
   ELSE
      v_result := p_num2;
   END IF;
   RETURN v_result;
END;

/* printMax procedure definition */
PROCEDURE printMax(
    p_num1 IN NUMBER,
    p_num2 IN NUMBER)    
AS
    v_result NUMBER;
BEGIN
    v_result := findMax(p_num1, p_num2);
    printOut('The max between ' || p_num1 || ' and ' || p_num2 || ' is ' || v_result);
END printMax;

/* printMin procedure definition */
PROCEDURE printMin(
    p_num1 IN NUMBER,
    p_num2 IN NUMBER)
AS
    v_result NUMBER;
BEGIN
    v_result := findMin(p_num1, p_num2);
    printOut('The min between ' || p_num1 || ' and ' || p_num2 || ' is ' || v_result);
END printMin;

/* countDown function definition */
PROCEDURE countDown(
    p_num IN NUMBER)
AS
    v_count NUMBER;
BEGIN
    printOut('Counting down from ' || p_num);
    v_count := p_num;
    LOOP
        EXIT WHEN v_count < 0;
        printOut(v_count || '...');
        v_count := v_count - 1;
    END LOOP;
END countDown;

/* global block BEGIN */
BEGIN
   g_num1 := 10;
   g_num2 := 5;

   printMax(g_num1, g_num2);
   printMin(g_num1, g_num2);

   countDown(5);
   
   v_random_number := DBMS_RANDOM.VALUE(low => 1, high => 10);
   printOut(v_random_number);
END;
/