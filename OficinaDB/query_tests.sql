SELECT descricao, valor_mao_obra
FROM Servico
WHERE valor_mao_obra > 100.00;

SELECT
    OS.id_os,
    OS.data_abertura,
    (
        COALESCE(SUM(IOS.quantidade * IOS.valor_unitario), 0) +
        COALESCE(SUM(IOP.quantidade * IOP.valor_unitario), 0)
    ) AS valor_total_calculado
FROM
    OrdemServico AS OS
LEFT JOIN
    ItensOS_Servicos AS IOS ON OS.id_os = IOS.id_os
LEFT JOIN
    ItensOS_Pecas AS IOP ON OS.id_os = IOP.id_os
GROUP BY
    OS.id_os, OS.data_abertura;
    
SELECT
    C.nome AS nome_cliente,
    A.data_agendamento,
    V.placa,
    V.marca
FROM
    Agendamento AS A
INNER JOIN
    Cliente AS C ON A.id_cliente = C.id_cliente
INNER JOIN
    Veiculo AS V ON A.id_veiculo = V.id_veiculo
WHERE
    V.marca = 'Volkswagen'
ORDER BY
    A.data_agendamento;
    
SELECT
    M.nome,
    COUNT(OS.id_os) AS total_os_concluidas
FROM
    Mecanico AS M
INNER JOIN
    OrdemServico AS OS ON M.id_mecanico = OS.id_mecanico
WHERE
    OS.status = 'Concluída'
GROUP BY
    M.nome
HAVING
    COUNT(OS.id_os) > 1;