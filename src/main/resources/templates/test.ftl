<!DOCTYPE HTML>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/assets/css/style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Scada:ital,wght@0,400;0,700;1,400;1,700&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:300i,400,700&display=swap&subset=cyrillic-ext"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script src="https://kit.fontawesome.com/54153b1a19.js" crossorigin="anonymous"></script>
    <title>Lingua</title>
    <link rel="icon" href="/static/assets/icon/ic_launcher.ico"/>
</head>

<body>

<!-- Header -->
<header class="header" id="header">
    <div class="container2">
        <div class="header_inner">
            <div class="header_logo" data-scroll="#intro">Lingua</div>
            <nav class="nav2" id="nav">
                <a class="nav_link2" href="/learn">Learn</a>
                <a class="nav_link2 current" href="/test">Test</a>
                <a class="nav_link2" href="/match">Match</a>
                <a class="nav_link2 profile" href="/profile">Profile</a>
                <a class="nav_link2 logout" href="/logout">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <span class="material-icons exit">
                            exit_to_app
                        </span> Logout
                </a>
            </nav>
        </div>
    </div>
</header>
<div class="page">
    <section class="test">
        <#if word??>
            <div class="counter">
                ${counter}
            </div>
            <div class="test_group">

                <div class="text_group test">
                    <div class="word">
                        ${word.getLangFirst()}
                    </div>
                </div>
                <div class="buttons_group_test">
                    <form action="/test/testWord" id="word_form1" method="post">
                        <input type="hidden" name="word_id" value="${test_word_1.getId()}"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="button_choose">
                            <div class="button_choose_text unselectable"
                                 onclick="document.getElementById('word_form1').submit();"
                                 href="javascript:{}">${test_word_1.getLangSecond()}</div>
                        </div>
                    </form>
                    <form action="/test/testWord" id="word_form2" method="post">
                        <input type="hidden" name="word_id" value="${test_word_2.getId()}"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="button_choose">
                            <div class="button_choose_text unselectable"
                                 onclick="document.getElementById('word_form2').submit();"
                                 href="javascript:{}">${test_word_2.getLangSecond()}</div>
                        </div>
                    </form>
                    <form action="/test/testWord" id="word_form3" method="post">
                        <input type="hidden" name="word_id" value="${test_word_3.getId()}"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="button_choose">
                            <div class="button_choose_text unselectable"
                                 onclick="document.getElementById('word_form3').submit();"
                                 href="javascript:{}">${test_word_3.getLangSecond()}</div>
                        </div>
                    </form>
                    <form action="/test/testWord" id="word_form4" method="post">
                        <input type="hidden" name="word_id" value="${test_word_4.getId()}"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="button_choose">
                            <div class="button_choose_text unselectable"
                                 onclick="document.getElementById('word_form4').submit();"
                                 href="javascript:{}">${test_word_4.getLangSecond()}</div>
                        </div>
                    </form>
                </div>
            </div>
        <#else>
            <div class="test_group">
                <div class="text_group test">
                    <div class="word">
                        Learn some words to start here
                    </div>
                </div>
            </div>
        </#if>
    </section>


</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="assets/js/app.js"></script>
</body>

</html>