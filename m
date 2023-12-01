Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC780018C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645209.1007196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tDZ-0003je-HE; Fri, 01 Dec 2023 02:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645209.1007196; Fri, 01 Dec 2023 02:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8tDZ-0003i0-E1; Fri, 01 Dec 2023 02:25:25 +0000
Received: by outflank-mailman (input) for mailman id 645209;
 Fri, 01 Dec 2023 02:25:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tDY-0003hu-KJ
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:25:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0176442-8ff0-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 03:25:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F5E960CEB;
 Fri,  1 Dec 2023 02:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69787C433C8;
 Fri,  1 Dec 2023 02:25:18 +0000 (UTC)
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
X-Inumbo-ID: e0176442-8ff0-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701397519;
	bh=TYwVLYuzrgfGAd/n9Fx83X+L5TN+T7IvkFJG6UNoud4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YduDuE1ufirzfIXDmH5QzENWZoALSXaUVBushJuHReDirHiV6uDKZ/lDtfMnWXgBz
	 kG5tv9ZE7Ct+sMS4Ggk+/b1d6otKyV5/HYO7fpVHTyjFve+3W/0iu/Y7TY20s+rjND
	 1fWmHNJWjLkQY0tD5QUYtnLzLKbFDucxxVibLH9h20nUvMi9hKSf0pP+XlpEqNheyq
	 88R8R76hyYV8m8bEVXQmuXXJiozs39e8fQCb1Kv2eN7SXO7nJvo6C5iMf9XyA3NATT
	 oFYThMY2m2CXfg0rOq8w2mdZI5Qn6pKqcktE74Iriw72sMohHRJeHAz3IgCS2+ypuT
	 X7sk+Nx9c4T2Q==
Date: Thu, 30 Nov 2023 18:25:17 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] docs/misra: fix a typo in rules.rst
In-Reply-To: <d385998bd7f45c9753db504f8b89db5ed8bc90ce.1701364429.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301825110.110490@ubuntu-linux-20-04-desktop>
References: <d385998bd7f45c9753db504f8b89db5ed8bc90ce.1701364429.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Nicola Vetrini wrote:
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  docs/misra/rules.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 53dab0070c7b..75921b9a3463 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -531,7 +531,7 @@ maintainers if you want to suggest a change.
>         the future or with another compiler.  For these reasons we discourage
>         the introduction of new reserved identifiers in Xen, and we see it as
>         positive the reduction of reserved identifiers. At the same time,
> -       certain identifiers starting with wo underscores are also commonly used
> +       certain identifiers starting with two underscores are also commonly used
>         in Linux (e.g. __set_bit) and we don't think it would be an improvement
>         to rename them.
>  
> -- 
> 2.34.1
> 

