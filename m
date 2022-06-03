Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D89453C189
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jun 2022 03:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341351.566580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvfH-0007Vl-MK; Fri, 03 Jun 2022 00:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341351.566580; Fri, 03 Jun 2022 00:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwvfH-0007U0-HC; Fri, 03 Jun 2022 00:59:47 +0000
Received: by outflank-mailman (input) for mailman id 341351;
 Fri, 03 Jun 2022 00:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwvfG-0007Tu-53
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 00:59:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74273651-e2d8-11ec-837f-e5687231ffcc;
 Fri, 03 Jun 2022 02:59:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0A1E1CE1D34;
 Fri,  3 Jun 2022 00:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13C1C385A5;
 Fri,  3 Jun 2022 00:59:39 +0000 (UTC)
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
X-Inumbo-ID: 74273651-e2d8-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654217980;
	bh=6VjJLc3D4YoG+52fRsVLrMuE+lidkCVepcikso8+YUs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fKAoks7G7jMQ+ENDtgFlFk0VzUus04JejR6r4D4dhy9tJU2QNmvr6qLeNEPtYrCLK
	 /3SxZLGLCHZJc3848mRvNnc19rvYdM1ZTzvrwwyEAMct3IJOur+/ZX0mPempcG5snJ
	 QZ5HimeB/D0jUEmRMAIh+i67PlQ/eLTANFw8+dppolkIfCDH2mpJnpJJu74H6Xf+Tx
	 Gx6pet55yzm8MHD6VDdXnGcnVx82UWbS+nq+o1pH1bTByMdxguF4srfOevgUJlzzJo
	 5tNhVeg7RTzO2iKmYa0ox3OJeZ8itu8suu8AqMg45wMWTP7dHh2AIq9mpQN3mYhNkM
	 NJEeSX7zFPiLQ==
Date: Thu, 2 Jun 2022 17:59:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 3/9] xen: update SUPPORT.md for static allocation
In-Reply-To: <20220531031241.90374-4-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206021758010.2783803@ubuntu-linux-20-04-desktop>
References: <20220531031241.90374-1-Penny.Zheng@arm.com> <20220531031241.90374-4-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 31 May 2022, Penny Zheng wrote:
> SUPPORT.md doesn't seem to explicitly say whether static memory is
> supported, so this commit updates SUPPORT.md to add feature static
> allocation tech preview for now.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v5 changes:
> - new commit
> ---
>  SUPPORT.md | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ee2cd319e2..5980a82c4b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -278,6 +278,13 @@ to boot with memory < maxmem.
>  
>      Status, x86 HVM: Supported
>  
> +### Static Allocation
> +
> +Static allocation refers to system or sub-system(domains) for which memory
> +areas are pre-defined by configuration using physical address ranges.

Although I completely understand what you mean I would rather not use
the word "sub-system" as we haven't used it before in a Xen context. So
instead I would only use domains. I would write it like this:


### Static Allocation

Static allocation refers to domains for which memory areas are
pre-defined by configuration using physical address ranges.

Status, ARM: Tech Preview


With that you can add

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +    Status, ARM: Tech Preview
> +
>  ### Memory Sharing
>  
>  Allow sharing of identical pages between guests
> -- 
> 2.25.1
> 

