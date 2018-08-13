// --
// Copyright (C) 2012-2018 Znuny GmbH, http://znuny.com/
// --
// This software comes with ABSOLUTELY NO WARRANTY. For details, see
// the enclosed file COPYING for license information (AGPL). If you
// did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
// --

"use strict";

var Core   = Core || {};

Core.Agent = Core.Agent || {};

/**
 * @namespace
 * @exports TargetNS as Core.Agent.Znuny4OTRSZoomArticleDetailsExpand
 * @description
 *      This namespace contains the special functions for Znuny4OTRSZoomArticleDetailsExpand.
 */
Core.Agent.Znuny4OTRSZoomArticleDetailsExpand = (function (TargetNS) {

    TargetNS.Init = function () {
        var ArticleDetailsEnabled = true,
            Articles = $('#ArticleItems > div');

        var AllArticlesExpand = Core.Config.Get('Core::Znuny4OTRS::ZoomArticleDetailsExpand::AllArticles') || 0;

        // Only automatically show article details if there's only one article.
        if (Articles.length != 1 && !AllArticlesExpand) {
            return true;
        }

        // Click on 'Toggle article details' in ticket zoom to show additional
        // information about articles. The toggle is not available initially.
        // Try as long as necessary.
        Core.App.Subscribe('Event.AJAX.ContentUpdate.Callback', function() {
            var $InfoToggle = $('#ArticleItems .WidgetAction.Expand .fa-info');

            // A click on the info icon must be handled to permanently enable/disable article details.
            // Because OTRS creates new elements after clicking an article in the ticket zoom article list,
            // it's necessary to recreate the trigger for possible new element.
            $InfoToggle
                .off('click.Znuny4OTRSZoomArticleDetailsExpand')
                .on('click.Znuny4OTRSZoomArticleDetailsExpand', function () {
                    ArticleDetailsEnabled = !ArticleDetailsEnabled;
                });

            // Don't use click trigger on icon to show article details because it's needed
            // above to recognize a real user click.
            if (ArticleDetailsEnabled) {
                $('#ArticleItems .WidgetSimple').addClass('MenuExpanded');
                $('#ArticleItems .WidgetMenu').css('display', 'block');
            }
        });

        return true;
    }

    Core.Init.RegisterNamespace(TargetNS, 'APP_MODULE');

    return TargetNS;
}(Core.Agent.Znuny4OTRSZoomArticleDetailsExpand || {}));
