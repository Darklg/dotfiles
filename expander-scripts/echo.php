<?php
$html = '';

/* Convert some functions */
$text = str_replace('<?php the_permalink', '<?php echo get_permalink', $text);
$text = str_replace('<?php the_title', '<?php echo get_the_title', $text);

/* Prepare content */
$text = str_replace("<?php", "\n<?php\n", $text);
$text = str_replace("?>", "\n?>\n", $text);
$text_lines = explode("\n", trim($text));

$safe_starts = array(
    '/*',
    'the_',
    'get_',
    'the_',
    'do_action'
);

/* Filter safe words */
$safe_words = array('echo', 'for', 'foreach', 'continue;', 'return;', 'if', 'while', 'endif', 'endif;', 'endwhile;', 'endwhile', 'endforeach;', 'endforeach', 'do_action', 'include', 'require');
foreach ($text_lines as $line) {

    $line = str_replace('if(', 'if (', $line);
    $line = str_replace('foreach(', 'foreach (', $line);
    $line = str_replace(array(';?>', '; ?>'), " . '", $line);
    $line = str_replace(array('<?php', '?>'), "", $line);
    $line = trim($line);
    if (empty($line)) {
        continue;
    }
    $line_words = explode(' ', $line);


    foreach ($safe_starts as $safe_start) {
        $safe_start_len = strlen($safe_start);
        if (substr($line, 0, $safe_start_len) == $safe_start) {
            $html .= $line . "\n";
            continue 2;
        }
    }
    if (in_array($line[0], array('{', '}', '$')) || in_array($line_words[0], $safe_words) || in_array($line_words[0] . ';', $safe_words)) {
        $html .= $line . "\n";
        continue;
    }
    $line = str_replace('<?php echo ', "' . ", $line);
    $html .= "echo '" . $line . "';\n";
}

/* Fix line breaks */
$html = str_replace(">';
echo get_", ">' . get_", $html);
$html = str_replace("href=\"';
echo get_", "href=\"' . get_", $html);
$html = str_replace("();
echo '\">';", "() . '\">';", $html);
$html = str_replace(">';
echo wpa", ">' . wpa", $html);
$html = str_replace(")
echo '<", ") . '<", $html);
$html = str_replace(");
echo '</", ") . '</", $html);
$html = str_replace(";
echo __(", " . __(", $html);
$html = preg_replace("/\>\';\necho ([a-z])/", ">' . $1", $html);

echo $html;
