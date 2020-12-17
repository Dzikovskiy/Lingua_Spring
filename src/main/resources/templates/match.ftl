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
    <div class="container">
        <div class="header_inner">
            <div class="header_logo" data-scroll="#intro">Lingua</div>
            <nav class="nav" id="nav">
                <a class="nav_link" href="/profile">Profile</a>
                <a class="nav_link" href="/learn">Learn</a>
                <a class="nav_link" href="/test">Test</a>
                <a class="nav_link current" href="/match">Match</a>
                <a class="nav_link logout" href="/logout">
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
    <section class="match">
<#--        <#if word??>-->
            <div class="button_match_group">
                <div class="button_match">
                    <div class=" button_match_text unselectable">
                        five
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        one
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        what
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        пяць
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        water
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        хлеб
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        вада
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        чатыры
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        four
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        адзiн
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        bread
                    </div>
                </div>
                <div class="button_match ">
                    <div class="button_match_text unselectable">
                        што
                    </div>
                </div>
            </div>
<#--        <#else >-->
<#--            <div class="test_group">-->
<#--                <div class="text_group test">-->
<#--                    <div class="word">-->
<#--                        Test some words to start here-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--        </#if>-->

    </section>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js "></script>
<script src="assets/js/app.js "></script>
</body>

</html>