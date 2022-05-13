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

        $leitor_id1 = 'amigo1';
        $leitor_id2 = 'amigo2';
        

        $sql =
            'SELECT l1.nome amigo1 ,l2.nome amigo2
      FROM amizade AS a
      JOIN leitor AS l1
      ON a.leitor_id1 = l1.leitor_id
      JOIN leitor AS l2
      ON a.leitor_id2 = l2.leitor_id;';




        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . $leitor_id1 . '</th>' .
            '        <th>' . $leitor_id2 . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$leitor_id1] . '</td>' .
                    '<td>' . $registro[$leitor_id2] . '</td>' ;
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