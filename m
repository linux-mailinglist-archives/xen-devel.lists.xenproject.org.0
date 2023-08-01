Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A93376C09E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 00:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574580.900002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyHB-0007b5-4N; Tue, 01 Aug 2023 22:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574580.900002; Tue, 01 Aug 2023 22:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQyHB-0007Ym-0P; Tue, 01 Aug 2023 22:55:37 +0000
Received: by outflank-mailman (input) for mailman id 574580;
 Tue, 01 Aug 2023 22:55:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j6MK=DS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQyH9-00068k-9M
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 22:55:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 858e2184-30be-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 00:55:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BA706170A;
 Tue,  1 Aug 2023 22:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4132BC433C7;
 Tue,  1 Aug 2023 22:55:32 +0000 (UTC)
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
X-Inumbo-ID: 858e2184-30be-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690930532;
	bh=Ee7DDAYHauG77sy+uzAQQVwyNNEPwIv9SOzMTw9Jtf0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LfWzSf+7c01925+Yic7h1PjDb2MPLbd6pWIQs5myUaeK2hKOGoAq1HMfcAu02IzE+
	 xC3GMd3P/X9p9TW5ffdIHUY00udhP51VEp0O28eNsoLFec/y2zf7HXXcs1I95sOjDh
	 CnVKVIwb0vF0XRL7eREjEcCTb4jDUr/aqt9WEn5HQJuh06Xqjg/ENhtKmkqklFCwiT
	 exCGK2yLruncG9jAauZ4U/5ZHI7cNHE0Y8QDeaniibVXpIYmZSJ+D/SMVEfsKOrok0
	 DpcB55v5sWsx9y7ZPAXgE1aekvQqGo0rMd+PEn6MEr+ZIwlHeYbQILyhSWDIli4Kpk
	 i+ZHlN+EMvO3w==
Date: Tue, 1 Aug 2023 15:55:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 4/4] automation/eclair: avoid failure in case of
 missing merge point
In-Reply-To: <b1b5e151a176d2644fd836eec6190f98c23894d0.1690881495.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308011546010.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com> <b1b5e151a176d2644fd836eec6190f98c23894d0.1690881495.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Simone Ballarin wrote:
> In the context of an auto pull request, when a common merge point
> is not found the integration will continue the analysis without
> failing.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/action.settings | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/action.settings b/automation/eclair_analysis/ECLAIR/action.settings
> index 528bc24c72..f96368ffc7 100644
> --- a/automation/eclair_analysis/ECLAIR/action.settings
> +++ b/automation/eclair_analysis/ECLAIR/action.settings
> @@ -138,7 +138,9 @@ auto_pull_request)
>      git remote add autoPRRemote "${autoPRRemoteUrl}"
>      git fetch -q autoPRRemote
>      subDir="${ref}"
> -    baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD)
> +    if ! baseCommitId=$(git merge-base "autoPRRemote/${autoPRBranch}" HEAD); then
> +        baseCommitId=no_merge_point
> +    fi
>      jobHeadline="ECLAIR ${ANALYSIS_KIND} on repository ${repository}: ${pushUser} wants to merge ${repository}:${ref} (${headCommitId}) into ${autoPRRepository}/${autoPRBranch} (${baseCommitId})"
>      ;;
>  *)
> -- 
> 2.34.1
> 

