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

        $leitor_id = 'nome';
        $livro_id = 'titulo';
        

        $sql =
            'SELECT leitor.nome,
            livros.titulo
            FROM biblioteca
            INNER JOIN leitor
            ON biblioteca.leitor_id = leitor.leitor_id
            INNER JOIN livros
            ON biblioteca.livro_id = livros.livro_id;';




        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $leitor_id . '</th>' .
            '        <th>' . $livro_id . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$leitor_id] . '</td>' .
                    '<td>' . $registro[$livro_id] . '</td>' ;
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