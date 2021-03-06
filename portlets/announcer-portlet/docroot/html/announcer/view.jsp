<%--
    /**
    * Copyright (C) 2005-2014 Rivet Logic Corporation.
    *
    * This program is free software; you can redistribute it and/or
    * modify it under the terms of the GNU General Public License
    * as published by the Free Software Foundation; version 2
    * of the License.
    *
    * This program is distributed in the hope that it will be useful,
    * but WITHOUT ANY WARRANTY; without even the implied warranty of
    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    * GNU General Public License for more details.
    *
    * You should have received a copy of the GNU General Public License
    * along with this program; if not, write to the Free Software
    * Foundation, Inc., 51 Franklin Street, Fifth Floor,
    * Boston, MA 02110-1301, USA.
    */
--%>

<%@include file="/html/init.jsp"%>

<%
    String articles = renderRequest.getPreferences().getValue(AnnouncerPortlet.ARTICLE_ID, AnnouncerPortlet.LR_EMPTY_VALUE);
    long groupId = themeDisplay.getScopeGroupId();
    
%>
<c:set var="articlesIds" value="<%= articles %>"></c:set>
<c:set var="groupId" value="<%= groupId %>"></c:set>
<portlet:renderURL var="contentURL"
    windowState="<%= LiferayWindowState.POP_UP.toString() %>">
    <portlet:param name="<%=AnnouncerPortlet.JSP_PAGE %>" value="/html/announcer/content.jsp" />
</portlet:renderURL>
<portlet:resourceURL var="closeURL"/>

<c:if test="${ defaultArticle != '0' }">
    <div class="default-article">
        <liferay-ui:journal-article groupId="${groupId}"
            articleId="${defaultArticle}" />
    </div>

    <c:if test="${signedIn}">
        <aui:fieldset>
            <aui:button-row>
                <aui:button type="button" cssClass="btn-primary"
                    value="announcer-launch"
                    onClick="MyAnnouncerClass.displayContent(${groupId},'${user.uuid}','${articleVersionId}','${contentURL}','${pns}', '${closeURL}','${articlesIds}'.split(','))" />
            </aui:button-row>
        </aui:fieldset>
    </c:if>
</c:if>

<c:if test="${showAnnouncer}">
    <aui:script use="my-announcer">
        A.MyAnnouncerClass.displayContent(${groupId},'${user.uuid}',
                        '${articleVersionId}', '${contentURL}',
                        '${pns}', '${closeURL}', '${articlesIds}'.split(','));
    </aui:script>
</c:if>
