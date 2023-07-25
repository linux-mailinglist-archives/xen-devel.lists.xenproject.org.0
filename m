Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5577622EF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569922.891125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOGm-0000aP-2v; Tue, 25 Jul 2023 20:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569922.891125; Tue, 25 Jul 2023 20:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOGm-0000XE-0J; Tue, 25 Jul 2023 20:04:32 +0000
Received: by outflank-mailman (input) for mailman id 569922;
 Tue, 25 Jul 2023 20:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qOOGk-0007eJ-M9
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:04:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75e2fb5b-2b26-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 22:04:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9F11618BF;
 Tue, 25 Jul 2023 20:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115CFC433C7;
 Tue, 25 Jul 2023 20:04:25 +0000 (UTC)
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
X-Inumbo-ID: 75e2fb5b-2b26-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690315467;
	bh=7gVxt2p9J+lMgJ/yqUQ6jfFkLIHiGqhGDrlWV1ES+8o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UZsShGzA0zIFPJgOQITJXdpq0QjeTFU6fn33FnxX99pWzBGfTINLTW7lyR+9s3JRb
	 QvLI1TcQNs7nSF54d33m+e0H6U0S4JQz6LwhqPYlrP7oyQ/2/Fa8pLjLKjggPvZc3N
	 FjPp6QXU3ZM5eT/7cx9hgf8NVPeWeXroOHft6C2QBGpjNlOFxArU3XEK9aXKntvvzW
	 NRvSzsGtEOv1qe+ZFj9KXbVn2vaTM1DzfYpMGj4VEA4NuAIHTvXxyyVHAW6ydAHM1d
	 X1RPk63Beb0fPayXll4DuhHwTko/MzsdZ2UskRu9IcWzdiny4L9NIpOvdwtwpXtGIR
	 Nz7/+Z9tP4dFg==
Date: Tue, 25 Jul 2023 13:04:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/4] maintainers: Add ECLAIR reviewer
In-Reply-To: <dfe59e554a25a180b9bece8fd6a0f9a142654004.1690294965.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307251243380.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690294965.git.simone.ballarin@bugseng.com> <dfe59e554a25a180b9bece8fd6a0f9a142654004.1690294965.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Simone Ballarin wrote:
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> --
> Changes in v3:
> - split maintainer add in a separate patch;
> - substitute blanks with tabs;
> - fix file paths;
> - change role from maintainer to reviewer.
> 
> Changes in v2:
> - add ECLAIR configuration files (before they were fetched from a separate
>   repository);
> - now the pipeline fails if there are new violations of guidelines tagged
>   with clean:added.
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 180e57dac4..66ff0ed710 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -305,6 +305,12 @@ F:	xen/include/xen/libfdt/
>  F:	xen/include/xen/device_tree.h
>  F:	xen/drivers/passthrough/device_tree.c
>  
> +ECLAIR
> +R:	Simone Ballarin <simone.ballarin@bugseng.com>
> +S:	Supported
> +F: 	automation/eclair_analysis/
> +F: 	automation/scripts/eclair

There is still a whitespace problem: it is supposed to be only tabs, not
1 space then 1 tab. However, it can be fixed on commit:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



>  EFI
>  M:	Jan Beulich <jbeulich@suse.com>
>  S:	Supported
> -- 
> 2.34.1
> 

