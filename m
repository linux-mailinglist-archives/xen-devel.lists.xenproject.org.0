Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C6C75A2DA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 01:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566234.884780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMGge-0007D0-Im; Wed, 19 Jul 2023 23:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566234.884780; Wed, 19 Jul 2023 23:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMGge-0007B5-G0; Wed, 19 Jul 2023 23:34:28 +0000
Received: by outflank-mailman (input) for mailman id 566234;
 Wed, 19 Jul 2023 23:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+D1l=DF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMGgd-0007Ax-7P
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 23:34:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb2779b6-268c-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 01:34:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAF4B61839;
 Wed, 19 Jul 2023 23:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BB5C433C7;
 Wed, 19 Jul 2023 23:34:21 +0000 (UTC)
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
X-Inumbo-ID: cb2779b6-268c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689809663;
	bh=+YbbLSgZK+Uw1AA3E1iarkdRECGhJzsn2L5sDzBb5EU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ncXU2k58RXzjiR76+QgOYOj+T7S1K/OmoMUMmliNW/bEBQURpltNU++eIfh0un9KK
	 zgjrv1wZouv7ghyZcfDzZZxcU838i8o1/6s3KoC/teBFVvYYAwQWYCfGU9IeT1ZQgL
	 vExEUOSiS1k1o2Qw0ORL1vYCGfib/Y0T+NZhB8d3r0/E8tmqT96qmiciaSbwc7MH3e
	 F2JTsFBkZOFl+72w6Mf56j9dO8kb2d4s1S+K9prFC0DokHVH6w75XIn9yo4aCDalqj
	 r5iouPo3XofGNUBl+ekkxk9d9W2RXleS6/49nE9LvU2cyOMO1QS226rOWr39q3KX6P
	 qtdg2Lm7GRiwQ==
Date: Wed, 19 Jul 2023 16:34:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Yang Xu <yang.xu@mediatek.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] docs/misc: fix document typo
In-Reply-To: <20230718122529.19912-1-yang.xu@mediatek.com>
Message-ID: <alpine.DEB.2.22.394.2307191634110.3118466@ubuntu-linux-20-04-desktop>
References: <20230718122529.19912-1-yang.xu@mediatek.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Jul 2023, yang.xu@mediatek.com wrote:
> From: Yang Xu <yang.xu@mediatek.com>
> 
> Fix document typo for more accurate meaning
> 
> Signed-off-by: Yang Xu <yang.xu@mediatek.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/misc/xen-makefiles/makefiles.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-makefiles/makefiles.rst b/docs/misc/xen-makefiles/makefiles.rst
> index 04bc72601c..bc2f932fbc 100644
> --- a/docs/misc/xen-makefiles/makefiles.rst
> +++ b/docs/misc/xen-makefiles/makefiles.rst
> @@ -68,7 +68,7 @@ Descending down in directories
>  
>  	It is good practice to use a `CONFIG_` variable when assigning directory
>  	names. This allows the build system to totally skip the directory if the
> -	corresponding `CONFIG_` option is 'y'.
> +	corresponding `CONFIG_` option is not set to 'y'.
>  
>  Compilation flags
>  -----------------
> -- 
> 2.25.1
> 

