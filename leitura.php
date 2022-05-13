<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Bibliófilo's</h1>

        <h2>Livros</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $inicio_leitura = 'inicio_leitura';
        $fim_leitura = 'fim_leitura';
        $leitor_id = 'nome';
        $livro_id = 'titulo';
        

        $sql =
            'SELECT leitura.inicio_leitura,leitura.fim_leitura,leitor.nome nome,livros.titulo titulo
            FROM leitura
            INNER JOIN leitor
            ON leitura.leitor_id = leitor.leitor_id
            INNER JOIN livros
            ON leitura.livro_id = livros.livro_id;';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $inicio_leitura . '</th>' .
            '        <th>' . $fim_leitura . '</th>' .
            '        <th>' . $leitor_id . '</th>' .
            '        <th>' . $livro_id . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {

                echo '<tr>';

                echo '<td>' . $registro[$inicio_leitura] . '</td>' .
                    '<td>' . $registro[$fim_leitura] . '</td>' .
                    '<td>' . $registro[$leitor_id] . '</td>'.
                    '<td>' . $registro[$livro_id] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>