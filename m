Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A33CDADDD92
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 23:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018531.1395409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRdS8-0001xi-6a; Tue, 17 Jun 2025 21:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018531.1395409; Tue, 17 Jun 2025 21:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRdS8-0001vU-2Q; Tue, 17 Jun 2025 21:02:44 +0000
Received: by outflank-mailman (input) for mailman id 1018531;
 Tue, 17 Jun 2025 21:02:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hcls=ZA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRdS6-0001vO-EV
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 21:02:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 620f44b1-4bbe-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 23:02:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B37B65C5E68;
 Tue, 17 Jun 2025 21:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0282C4CEE3;
 Tue, 17 Jun 2025 21:02:28 +0000 (UTC)
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
X-Inumbo-ID: 620f44b1-4bbe-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750194150;
	bh=tLEpIxi5l6oSc84fZGU36wS/qMjNnrsl4ukBbDUEVlU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S221HgyKunaFanOemN1sAYFN7yIAUbj+HdZDZxhuwB3NaCtIfLEyKeKMjopOMWxFa
	 PbV9xpW9Y6JCJECLtySJqJVDqEyYQwCEPuPiw/LqcF86fgpnz0xyH5f6gYikZjHnpw
	 KFyOyjW6SUIWMMII+3cgXN1RoxRXWBqud74O4ImK4AcNpgM3SYTBYKyR5ybqGalv4f
	 1Ry07KqMcb3V4cZL4Jx+Y3sN5neofElG+hhFNVrHmEtPxkD6QDu3Ci3fe8ZniZActC
	 LkBPI8BWALt2HqAXwx3oOvrUexxeUymr9/u/L4VFsbLxQrQ2/saJicUv9gw+2hW0k+
	 4kTfJclYKs54A==
Date: Tue, 17 Jun 2025 14:02:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nick Rosbrook <rosbrookn@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: update my email address
In-Reply-To: <55a35aed605bafd38b6ccfd0bb6e401a5fdf9794.1750172048.git.rosbrookn@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2506171402021.1384757@ubuntu-linux-20-04-desktop>
References: <55a35aed605bafd38b6ccfd0bb6e401a5fdf9794.1750172048.git.rosbrookn@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jun 2025, Nick Rosbrook wrote:
> Change rosbrookn@gmail.com -> enr0n@ubuntu.com
> 
> Signed-off-by: Nick Rosbrook <rosbrookn@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13f31b0c1b..9aa7dd2f57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -330,7 +330,7 @@ F:	xen/arch/x86/debug.c
>  F:	tools/debugger/gdbsx/
>  
>  GOLANG BINDINGS
> -M:	Nick Rosbrook <rosbrookn@gmail.com>
> +M:	Nick Rosbrook <enr0n@ubuntu.com>
>  R:	George Dunlap <gwd@xenproject.org>
>  S:	Maintained
>  F:	tools/golang
> -- 
> 2.48.1
> 

