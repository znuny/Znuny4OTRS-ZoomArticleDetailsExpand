# Functionality

This package automatically displays the item details (sender, subject, etc.) in ticket zoom if only one item is displayed (item display configured as "Show one item" or ticket contains only one item).

If the article details should be displayed for all articles (with setting "Show all articles"), the SysConfig option __Core::Znuny::ZoomArticleDetailsExpand::AllArticles__ must be activated.

__NOTE__
The Znuny default configuration option __Ticket::Frontend::ArticleHeadVisibleDefault__ will be disabled on installation of this package because the function behind it is incompatible with that of this package. The functionality of this package is more extensive than that of the standard Znuny function so there are no disadvantages.
