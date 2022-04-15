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

        $autor_id = 'autor_id';
        $nome = 'nome';
        $idade = 'idade';
        $nacionalidade = 'nacionalidade';
        $livro_id = 'livro_id';
        

        $sql =
            'SELECT ' . $autor_id .
            '     , ' . $nome .
            '     , ' . $idade .
            '     , ' . $nacionalidade .
            '     , ' . $livro_id .
            '  FROM leitor';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $autor_id . '</th>' .
            '        <th>' . $nome . '</th>' .
            '        <th>' . $idade . '</th>' .
            '        <th>' . $nacionalidade . '</th>' .
            '        <th>' . $livro_id . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$autor_id] . '</td>' .
                    '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$idade] . '</td>' .
                    '<td>' . $registro[$nacionalidade] . '</td>'.
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