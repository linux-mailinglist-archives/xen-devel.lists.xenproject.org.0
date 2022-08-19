Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9E59A843
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390521.628024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAM7-0002fe-15; Fri, 19 Aug 2022 22:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390521.628024; Fri, 19 Aug 2022 22:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAM6-0002d4-Tp; Fri, 19 Aug 2022 22:20:42 +0000
Received: by outflank-mailman (input) for mailman id 390521;
 Fri, 19 Aug 2022 22:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAM4-0002cu-Rf
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:20:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b5e906-200d-11ed-bd2e-47488cf2e6aa;
 Sat, 20 Aug 2022 00:20:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAD1D617A8;
 Fri, 19 Aug 2022 22:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14CAC433B5;
 Fri, 19 Aug 2022 22:20:37 +0000 (UTC)
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
X-Inumbo-ID: 27b5e906-200d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947638;
	bh=oN5/OXkTIuNMXy07I8nXi0x7huXUNwDLSBvqF4ZXMUw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UfoaNufM7s+Z0aCKGW7IS5p1bA4RmMU2jyMPgzFem7nt3YuMApsATlGBxnIBLKZy0
	 L9ai9UDcsSSpcezjXPK1g0+1VlRyCrdm1GQbsBb9uL9SgGh2SNR97en2ltLt7Q5jim
	 Zxuu4i4YlHycdSHUbpTgmHkmzWIJMw1RdoJ25VSJqa+y/z1MCsB7VNZKrEpZ0VZFiC
	 zSsmTSlGuAmF/wvYpLVLxreepaXk1S/hZP73gR4iyo4F88pGl7jcoOB/mXgIty3VS4
	 IVqhLpSFQE7HYA3BfgNK3S3MusiuM5DNagP7E+nVZX98i7pFn5f8zUDR9MXP2o2C9z
	 IkmDcLIU3iyzQ==
Date: Fri, 19 Aug 2022 15:20:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
In-Reply-To: <20220819194359.1196539-8-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191519320.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-8-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macros dt_for_each_property_node(), dt_for_each_device_node() and
> dt_for_each_child_node(), add parentheses around the macro parameters that
> have the arrow operator applied, to prevent against unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/device_tree.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 430a1ef445..6e4391c126 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -222,13 +222,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
>  #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>  
>  #define dt_for_each_property_node(dn, pp)                   \
> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
>  
>  #define dt_for_each_device_node(dt, dn)                     \
> -    for ( dn = dt; dn != NULL; dn = dn->allnext )
> +    for ( dn = dt; dn != NULL; dn = (dn)->allnext )
>  
>  #define dt_for_each_child_node(dt, dn)                      \
> -    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
> +    for ( dn = (dt)->child; dn != NULL; dn = (dn)->sibling )
>  
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)
> -- 
> 2.34.1
> 

