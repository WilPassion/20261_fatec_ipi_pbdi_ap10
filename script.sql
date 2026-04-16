-----------------------------------------------
-- Estrutura de Repetição 
-----------------------------------------------

-- 1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o
-- enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.

-- 1059) Gerar inteiros no intervalo de -50 a 50 -> Write a program that prints all even numbers between 1 and 100, including them if it is the case.
-- FOR
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        IF i % 2 = 0 THEN
            RAISE NOTICE '%', i;
        END IF;
    END LOOP;
END;
$$

-- WHILE
DO $$
DECLARE
    contador INT := 1;
BEGIN
    WHILE contador <= 100 LOOP
        IF contador % 2 = 0 THEN
            RAISE NOTICE '%', contador;
        END IF;

        contador := contador + 1;
    END LOOP;
END;
$$

-- LOOP
DO $$
DECLARE
    contador INT := 1;
BEGIN
    LOOP
        EXIT WHEN contador > 100;

        IF contador % 2 <> 0 THEN
            contador := contador + 1;
            CONTINUE;
        END IF;

        RAISE NOTICE '%', contador;
        contador := contador + 1;
    END LOOP;
END;
$$

-- FOREACH
DO $$
DECLARE
    valores INT[] := ARRAY[
		2, 4, 6, 8, 10,
        12, 14, 16, 18, 20,
        22, 24, 26, 28, 30,
        32, 34, 36, 38, 40,
        42, 44, 46, 48, 50,
        52, 54, 56, 58, 60,
        62, 64, 66, 68, 70,
        72, 74, 76, 78, 80,
        82, 84, 86, 88, 90,
        92, 94, 96, 98, 100
    ];
    valor INT;
BEGIN
    FOREACH valor IN ARRAY valores LOOP
        RAISE NOTICE '%', valor;
    END LOOP;
END;
$$

-- 1060) Gerar inteiros no intervalo de -50 a 50. -> Write a program that reads 6 numbers. These numbers will only be positive or negative (disregard null values). Print the total number of positive numbers.
-- FOR
DO $$
DECLARE
    numero INT;
    positivos INT := 0;
BEGIN
    FOR i IN 1..6 LOOP
        SELECT valor_aleatorio(-50, 50) INTO numero;

        IF numero > 0 THEN
            positivos := positivos + 1;
        END IF;
    END LOOP;

    RAISE NOTICE '% valores positivos', positivos;
END;
$$

-- WHILE
DO $$
DECLARE
    contador INT := 1;
    numero INT;
    positivos INT := 0;
BEGIN
    WHILE contador <= 6 LOOP
        SELECT valor_aleatorio(-50, 50) INTO numero;

        IF numero > 0 THEN
            positivos := positivos + 1;
        END IF;

        contador := contador + 1;
    END LOOP;

    RAISE NOTICE '% valores positivos', positivos;
END;
$$

-- LOOP
DO $$
DECLARE
    contador INT := 1;
    numero INT;
    positivos INT := 0;
BEGIN
    LOOP
        EXIT WHEN contador > 6;

        SELECT valor_aleatorio(-50, 50) INTO numero;

        IF numero > 0 THEN
            positivos := positivos + 1;
        END IF;

        contador := contador + 1;
    END LOOP;

    RAISE NOTICE '% valores positivos', positivos;
END;
$$

-- FOREACH
DO $$
DECLARE
    valores INT[] := ARRAY[
        valor_aleatorio(-50, 50),
        valor_aleatorio(-50, 50),
        valor_aleatorio(-50, 50),
        valor_aleatorio(-50, 50),
        valor_aleatorio(-50, 50),
        valor_aleatorio(-50, 50)
    ];
    valor INT;
    positivos INT := 0;
BEGIN
    FOREACH valor IN ARRAY valores LOOP
        IF valor > 0 THEN
            positivos := positivos + 1;
        END IF;
    END LOOP;

    RAISE NOTICE '% valores positivos', positivos;
END;
$$

-- 1071) Gerar inteiros no intervalo de 20 a 50 -> Read two integer values X and Y. Print the sum of all odd values between them.
-- FOR
DO $$
DECLARE
    x INT;
    y INT;
    inicio INT;
    fim INT;
    soma INT := 0;
BEGIN
    SELECT valor_aleatorio(20, 50) INTO x;
    SELECT valor_aleatorio(20, 50) INTO y;

    IF x < y THEN
        inicio := x + 1;
        fim := y - 1;
    ELSE
        inicio := y + 1;
        fim := x - 1;
    END IF;

    FOR i IN inicio..fim LOOP
        IF i % 2 <> 0 THEN
            soma := soma + i;
        END IF;
    END LOOP;

    RAISE NOTICE 'X = %, Y = %, Soma = %', x, y, soma;
END;
$$

-- WHILE
DO $$
DECLARE
    x INT;
    y INT;
    inicio INT;
    fim INT;
    atual INT;
    soma INT := 0;
BEGIN
    SELECT valor_aleatorio(20, 50) INTO x;
    SELECT valor_aleatorio(20, 50) INTO y;

    IF x < y THEN
        inicio := x + 1;
        fim := y - 1;
    ELSE
        inicio := y + 1;
        fim := x - 1;
    END IF;

    atual := inicio;

    WHILE atual <= fim LOOP
        IF atual % 2 <> 0 THEN
            soma := soma + atual;
        END IF;

        atual := atual + 1;
    END LOOP;

    RAISE NOTICE 'X = %, Y = %, Soma = %', x, y, soma;
END;
$$

-- LOOP
DO $$
DECLARE
    x INT;
    y INT;
    inicio INT;
    fim INT;
    atual INT;
    soma INT := 0;
BEGIN
    SELECT valor_aleatorio(20, 50) INTO x;
    SELECT valor_aleatorio(20, 50) INTO y;

    IF x < y THEN
        inicio := x + 1;
        fim := y - 1;
    ELSE
        inicio := y + 1;
        fim := x - 1;
    END IF;

    atual := inicio;

    LOOP
        EXIT WHEN atual > fim;

        IF atual % 2 <> 0 THEN
            soma := soma + atual;
        END IF;

        atual := atual + 1;
    END LOOP;

    RAISE NOTICE 'X = %, Y = %, Soma = %', x, y, soma;
END;
$$

-- FOREACH
DO $$
DECLARE
    x INT;
    y INT;
    inicio INT;
    fim INT;
    soma INT := 0;
    valores INT[];
    valor INT;
BEGIN
    SELECT valor_aleatorio(20, 50) INTO x;
    SELECT valor_aleatorio(20, 50) INTO y;

    IF x < y THEN
        inicio := x;
        fim := y;
    ELSE
        inicio := y;
        fim := x;
    END IF;

    valores := ARRAY[
        inicio + 1, inicio + 2, inicio + 3, inicio + 4, inicio + 5,
        inicio + 6, inicio + 7, inicio + 8, inicio + 9, inicio + 10,
        inicio + 11, inicio + 12, inicio + 13, inicio + 14, inicio + 15,
        inicio + 16, inicio + 17, inicio + 18, inicio + 19, inicio + 20,
        inicio + 21, inicio + 22, inicio + 23, inicio + 24, inicio + 25,
        inicio + 26, inicio + 27, inicio + 28, inicio + 29
    ];

    FOREACH valor IN ARRAY valores LOOP
        CONTINUE WHEN valor >= fim;

        IF valor % 2 <> 0 THEN
            soma := soma + valor;
        END IF;
    END LOOP;

    RAISE NOTICE 'X = %, Y = %, Soma = %', x, y, soma;
END;
$$
-- 1101) Gerar inteiros no intervalo de 1 a 100 -> Read an undetermined number of pairs values M and N (stop when any of these values is less or equal to zero). For each pair, print the sequence from the smallest to the biggest (including both) and the sum of consecutive integers between them (including both).
-- FOR
DO $$
DECLARE
    m INT;
    n INT;
    inicio INT;
    fim INT;
    soma INT;
BEGIN
    FOR tentativa IN 1..100 LOOP
        SELECT valor_aleatorio(-5, 100) INTO m;
        SELECT valor_aleatorio(-5, 100) INTO n;

        EXIT WHEN m <= 0 OR n <= 0;

        IF m < n THEN
            inicio := m;
            fim := n;
        ELSE
            inicio := n;
            fim := m;
        END IF;

        soma := 0;

        FOR i IN inicio..fim LOOP
            RAISE NOTICE '%', i;
            soma := soma + i;
        END LOOP;

        RAISE NOTICE 'Soma = %', soma;
    END LOOP;
END;
$$

-- WHILE
DO $$
DECLARE
    m INT;
    n INT;
    inicio INT;
    fim INT;
    atual INT;
    soma INT;
BEGIN
    SELECT valor_aleatorio(-5, 100) INTO m;
    SELECT valor_aleatorio(-5, 100) INTO n;

    WHILE m > 0 AND n > 0 LOOP
        IF m < n THEN
            inicio := m;
            fim := n;
        ELSE
            inicio := n;
            fim := m;
        END IF;

        atual := inicio;
        soma := 0;

        WHILE atual <= fim LOOP
            RAISE NOTICE '%', atual;
            soma := soma + atual;
            atual := atual + 1;
        END LOOP;

        RAISE NOTICE 'Soma = %', soma;

        SELECT valor_aleatorio(-5, 100) INTO m;
        SELECT valor_aleatorio(-5, 100) INTO n;
    END LOOP;
END;
$$

-- LOOP
DO $$
DECLARE
    m INT;
    n INT;
    inicio INT;
    fim INT;
    atual INT;
    soma INT;
BEGIN
    LOOP
        SELECT valor_aleatorio(-5, 100) INTO m;
        SELECT valor_aleatorio(-5, 100) INTO n;

        EXIT WHEN m <= 0 OR n <= 0;

        IF m < n THEN
            inicio := m;
            fim := n;
        ELSE
            inicio := n;
            fim := m;
        END IF;

        atual := inicio;
        soma := 0;

        LOOP
            EXIT WHEN atual > fim;
            RAISE NOTICE '%', atual;
            soma := soma + atual;
            atual := atual + 1;
        END LOOP;

        RAISE NOTICE 'Soma = %', soma;
    END LOOP;
END;
$$
-- FOREACH
DO $$
DECLARE
    pares INT[] := ARRAY[
        [valor_aleatorio(1, 100), valor_aleatorio(1, 100)],
        [valor_aleatorio(1, 100), valor_aleatorio(1, 100)],
        [valor_aleatorio(1, 100), valor_aleatorio(1, 100)],
        [valor_aleatorio(1, 100), valor_aleatorio(1, 100)],
        [0, valor_aleatorio(1, 100)]
    ];
    par INT[];
    valor_par INT;
    m INT;
    n INT;
    inicio INT;
    fim INT;
    soma INT;
    coluna INT;
    sequencia INT[];
    valor_seq INT;
BEGIN
    FOREACH par SLICE 1 IN ARRAY pares LOOP
        coluna := 0;

        FOREACH valor_par IN ARRAY par LOOP
            coluna := coluna + 1;

            IF coluna = 1 THEN
                m := valor_par;
            ELSE
                n := valor_par;
            END IF;
        END LOOP;

        EXIT WHEN m <= 0 OR n <= 0;

        IF m < n THEN
            inicio := m;
            fim := n;
        ELSE
            inicio := n;
            fim := m;
        END IF;

        soma := 0;

        sequencia := ARRAY[
            inicio, inicio + 1, inicio + 2, inicio + 3, inicio + 4,
            inicio + 5, inicio + 6, inicio + 7, inicio + 8, inicio + 9,
            inicio + 10, inicio + 11, inicio + 12, inicio + 13, inicio + 14,
            inicio + 15, inicio + 16, inicio + 17, inicio + 18, inicio + 19,
            inicio + 20, inicio + 21, inicio + 22, inicio + 23, inicio + 24,
            inicio + 25, inicio + 26, inicio + 27, inicio + 28, inicio + 29,
            inicio + 30, inicio + 31, inicio + 32, inicio + 33, inicio + 34,
            inicio + 35, inicio + 36, inicio + 37, inicio + 38, inicio + 39,
            inicio + 40, inicio + 41, inicio + 42, inicio + 43, inicio + 44,
            inicio + 45, inicio + 46, inicio + 47, inicio + 48, inicio + 49,
            inicio + 50, inicio + 51, inicio + 52, inicio + 53, inicio + 54,
            inicio + 55, inicio + 56, inicio + 57, inicio + 58, inicio + 59,
            inicio + 60, inicio + 61, inicio + 62, inicio + 63, inicio + 64,
            inicio + 65, inicio + 66, inicio + 67, inicio + 68, inicio + 69,
            inicio + 70, inicio + 71, inicio + 72, inicio + 73, inicio + 74,
            inicio + 75, inicio + 76, inicio + 77, inicio + 78, inicio + 79,
            inicio + 80, inicio + 81, inicio + 82, inicio + 83, inicio + 84,
            inicio + 85, inicio + 86, inicio + 87, inicio + 88, inicio + 89,
            inicio + 90, inicio + 91, inicio + 92, inicio + 93, inicio + 94,
            inicio + 95, inicio + 96, inicio + 97, inicio + 98, inicio + 99
        ];

        FOREACH valor_seq IN ARRAY sequencia LOOP
            CONTINUE WHEN valor_seq > fim;
            RAISE NOTICE '%', valor_seq;
            soma := soma + valor_seq;
        END LOOP;

        RAISE NOTICE 'Soma = %', soma;
    END LOOP;
END;
$$

-- 1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3
-- utilizando a regra de Sarrus. Veja a regra aqui:
-- https://en.wikipedia.org/wiki/Rule_of_Sarrus
-- Preencha a matriz com valores inteiros aleatórios no intervalo de 1 a 12.
DO $$
DECLARE
    a INT := valor_aleatorio(1,12);
    b INT := valor_aleatorio(1,12);
    c INT := valor_aleatorio(1,12);
    d INT := valor_aleatorio(1,12);
    e INT := valor_aleatorio(1,12);
    f INT := valor_aleatorio(1,12);
    g INT := valor_aleatorio(1,12);
    h INT := valor_aleatorio(1,12);
    i INT := valor_aleatorio(1,12);

    det INT;
BEGIN
    det := (a*e*i + b*f*g + c*d*h)
         - (c*e*g + b*d*i + a*f*h);

    RAISE NOTICE 'Matriz:';
    RAISE NOTICE '% % %', a, b, c;
    RAISE NOTICE '% % %', d, e, f;
    RAISE NOTICE '% % %', g, h, i;

    RAISE NOTICE 'Determinante: %', det;
END;
$$;