Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E6576C09C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574577.899983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyGs-0006f8-EA; Tue, 01 Aug 2023 22:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574577.899983; Tue, 01 Aug 2023 22:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyGs-0006cm-Ag; Tue, 01 Aug 2023 22:55:18 +0000
Received: by outflank-mailman (input) for mailman id 574577;
 Tue, 01 Aug 2023 22:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j6MK=DS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQyGr-0006a5-Fi
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:55:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79d8104c-30be-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 00:55:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD3BD6173D;
 Tue,  1 Aug 2023 22:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F30C433C8;
 Tue,  1 Aug 2023 22:55:12 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 79d8104c-30be-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690930513;
	bh=QkLQ9kast8vfIEvHrFehxIBcnIuL8yfQwANOYm+u+uo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k/8WSzUNyZTNrX+Q8TS8L4nKgsJBgGarlkbUiGPU//ubkOjglinZWk/cWHH60VJd8
	 9L4kqk1l/8+NA5fbmFRDKi6WehB7/z53tRHgatBCspT2Tr4tShmjKHH/cpPr/7NCB+
	 ZqLT/qZoQI7jdlq7RCG+mN6LVMARM9Qeej2bIQS9ULnNRdCNPwsr4ojLPODvAU97ID
	 vBhME5rB9MS1fqtqAewalsnXHg52JzYMxZflhaZdoRPqkhpZrHnZu35kFBc18+X7rb
	 qCImrQxusu+MbBgyjvbxKsDvNl07lLlo5U3zJaXuBWNm+roEdB7dcrfJLLaLfIB1gr
	 KGPlyClMcHDCg==
Date: Tue, 1 Aug 2023 15:55:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/4] automation/eclair: add direct link to reports
In-Reply-To: <c07f1474bc4a46fbc969b02bbd1b95f88a872acc.1690881495.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308011542460.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com> <c07f1474bc4a46fbc969b02bbd1b95f88a872acc.1690881495.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Simone Ballarin wrote:
> This patch adds direct links to the analysis findings in the
> console log.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  .../eclair_analysis/ECLAIR/action.helpers     | 84 ++++++++++++++-----
>  1 file changed, 65 insertions(+), 19 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action.helpers b/automation/eclair_analysis/ECLAIR/action.helpers
> index 2ad6428eaa..df9bf2bd11 100644
> --- a/automation/eclair_analysis/ECLAIR/action.helpers
> +++ b/automation/eclair_analysis/ECLAIR/action.helpers
> @@ -1,17 +1,26 @@
> +esc=$(printf '\e')
> +cr=$(printf '\r')
> +
>  if [ -n "${GITLAB_CI:-}" ]; then
>      ci=gitlab
> +    eol=
> +    link_start="${esc}[33m"
> +    link_end="${esc}[m"
>  elif [ -n "${GITHUB_ACTION:-}" ]; then
>      ci=github
> +    eol="\\"
> +    link_start=
> +    link_end=
>  elif [ -n "${JENKINS_HOME:-}" ]; then
>      ci=jenkins
> +    eol="<br/>"
> +    link_start=
> +    link_end=
>  else
>      echo "Unexpected CI/CD context" >&2
>      exit 1
>  fi
>  
> -esc=$(printf '\e')
> -cr=$(printf '\r')
> -
>  open_section() {
>      id=$1
>      title=$2
> @@ -36,54 +45,86 @@ summary() {
>  
>      case "${ci}" in
>      github)
> -        nl="\\"
> +        eol="\\"
>          ;;
>      gitlab)
> -        nl=
> +        eol=
>          ;;
>      jenkins)
> -        nl="<br/>"
> +        eol="<br/>"
>          ;;
>      *)
> -        nl=
> +        eol=
>          ;;
>      esac
>  
> +    currentDbReportsUrl="${eclairReportUrlPrefix}/fs${jobDir}/PROJECT.ecd;/by_service.html#service&kind"
>      if [ -z "${newReports}" ]; then
> -        fixedMsg=
> +        fixedMsg="No fixed reports as there is no baseline"
>          unfixedMsg="Unfixed reports: ${unfixedReports}"
> -        countsMsg="${unfixedMsg}"
> +        referenceReportsMsgTxt=
> +        referenceReportsMsgLog=
>      else
>          fixedMsg="Fixed reports: ${fixedReports}"
>          unfixedMsg="Unfixed reports: ${unfixedReports} [new: ${newReports}]"
> -        countsMsg="${fixedMsg}${nl}
> -${unfixedMsg}"
> +        case "${event}" in
> +        pull_request | auto_pull_request)
> +            referenceDbReportsUrl="${eclairReportUrlPrefix}/fs${jobDir}/base/PROJECT.ecd;/by_service.html#service&kind"
> +            reference_kind=base
> +            ;;
> +        push)
> +            referenceDbReportsUrl="${eclairReportUrlPrefix}/fs${jobDir}/prev/PROJECT.ecd;/by_service.html#service&kind"
> +            reference_kind=previous
> +            ;;
> +        *)
> +            echo "Unexpected event ${event}" >&2
> +            exit 1
> +            ;;
> +        esac
>      fi
> +
>      case "${ci}" in
>      jenkins)
> +        if [ -n "${newReports}" ]; then
> +            referenceReportsMsgTxt="<a href="${referenceDbReportsUrl}">Browse ${reference_kind} reports</a>"
> +        fi
>          cat <<EOF >"${summaryTxt}"
> -${countsMsg}                                                                              ${nl}
> +${fixedMsg}${eol}
> +${unfixedMsg}                                                                              ${eol}
>  <a href="https://www.bugseng.com/eclair">
>    <img src="${eclairReportUrlPrefix}/rsrc/eclair.svg" width="100" />
>  </a>
>  <h3>${jobHeadline}</h3>
> -<a href="${indexHtmlUrl}">Browse analysis results</a>
> +<a href="${indexHtmlUrl}">Browse analysis summary</a>
> +<a href="${currentDbReportsUrl}">Browse current reports</a>
> +${referenceReportsMsgTxt}
>  EOF
>          ;;
>      *)
> +        if [ -n "${newReports}" ]; then
> +            referenceReportsMsgTxt="Browse ${reference_kind} reports: ${referenceDbReportsUrl}"
> +        fi
>          cat <<EOF >"${summaryTxt}"
>  <a href="https://www.bugseng.com/eclair">
>    <img src="${eclairReportUrlPrefix}/rsrc/eclair.svg" width="100" />
>  </a>
>  Analysis Summary
>  
> -${jobHeadline}${nl}
> -${countsMsg}${nl}
> -[Browse analysis](${indexHtmlUrl})
> +${jobHeadline}${eol}
> +${fixedMsg}${eol}
> +${unfixedMsg}${eol}
> +Browse analysis summary: ${indexHtmlUrl}
> +Browse current reports: ${currentDbReportsUrl}
> +${referenceReportsMsgTxt}
>  EOF
>          ;;
>      esac
>  
> +    analysisSummaryMsgLog="Browse analysis summary: ${link_start}${indexHtmlUrl}${link_end}"
> +    currentReportsMsgLog="Browse current reports: ${link_start}${currentDbReportsUrl}${link_end}"
> +    if [ -n "${newReports}" ]; then
> +        referenceReportsMsgLog="Browse ${reference_kind} reports: ${link_start}${referenceDbReportsUrl}${link_end}"
> +    fi
>      case ${ci} in
>      github)
>          cat "${summaryTxt}" >"${GITHUB_STEP_SUMMARY}"
> @@ -93,8 +134,11 @@ EOF
>          # Generate summary and print it (GitLab-specific)
>          cat <<EOF
>  ${jobHeadline}
> -${countsMsg}
> -Browse analysis: ${esc}[33m${indexHtmlUrl}${esc}[m
> +${fixedMsg}
> +${unfixedMsg}
> +${analysisSummaryMsgLog}
> +${currentReportsMsgLog}
> +${referenceReportsMsgLog}
>  EOF
>          close_section ECLAIR_summary
>          ;;
> @@ -103,7 +147,9 @@ EOF
>  ${jobHeadline}
>  ${fixedMsg}
>  ${unfixedMsg}
> -Browse analysis: ${indexHtmlUrl}
> +${analysisSummaryMsgLog}
> +${currentReportsMsgLog}
> +${referenceReportsMsgLog}
>  EOF
>          ;;
>      *)
> -- 
> 2.34.1
> 

