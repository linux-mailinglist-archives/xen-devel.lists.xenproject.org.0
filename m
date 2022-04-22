Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86350C498
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311312.528488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2gH-0000nQ-R4; Fri, 22 Apr 2022 23:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311312.528488; Fri, 22 Apr 2022 23:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2gH-0000k4-ND; Fri, 22 Apr 2022 23:27:17 +0000
Received: by outflank-mailman (input) for mailman id 311312;
 Fri, 22 Apr 2022 23:27:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni2gG-0000jy-9c
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 23:27:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdac0e91-c293-11ec-a405-831a346695d4;
 Sat, 23 Apr 2022 01:27:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8784E6178B;
 Fri, 22 Apr 2022 23:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9774CC385A4;
 Fri, 22 Apr 2022 23:27:12 +0000 (UTC)
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
X-Inumbo-ID: bdac0e91-c293-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650670033;
	bh=3WouP7I5Z0D1Pgp3vsl29XDpy01zQPzK8XtCcoY38xk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QkKD36LggfOTQfEkjsbRrQcUV5TB519DZ8Kt9xuHSscFX+Hun4B7EtdXHyqI+v1tS
	 okHgjCo/QwNUoQoqYz+BgBr9j6QZpJ0JCOwqXTduMVL2fvw7+inEekjx+krR3w+mHS
	 Lp+6MDOhzlqL5NUxpug3eC+IGn+XTmfe7dyFVwUjKU3D2w6BK0gIaRp9sQYbr4HkmA
	 17Ihqy8UjxsGxo07RsRsmFEqj419vI78NnV3SgM2CnrwancdEWW4lycXOphPilWDGy
	 nyHw4cfARysZ+ch5GpD8uVR503JTAWWdGNrCaTngnOGHDIjw1xsPOJap9Krh6Wq5ZD
	 3FNRYdyPxI+bA==
Date: Fri, 22 Apr 2022 16:27:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Paran Lee <p4ranlee@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm: fdt fix duplicated ternary operator, shift
 operations
In-Reply-To: <20220422185251.GA7124@DESKTOP-NK4TH6S.localdomain>
Message-ID: <alpine.DEB.2.22.394.2204221627060.915916@ubuntu-linux-20-04-desktop>
References: <20220422185251.GA7124@DESKTOP-NK4TH6S.localdomain>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 23 Apr 2022, Paran Lee wrote:
> It doesn't seem necessary to do duplicate ternary operation and calculation
> of order shift using fdt32_to_cpu macro.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/bootfdt.c  | 12 ++++++++++--
>  xen/common/libfdt/fdt.c | 10 +++++-----
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index e318ef9603..e5b885a7f2 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -159,8 +159,16 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>              continue;
>          }
>  
> -        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> -        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> +        if ( depth > 0 )
> +        {
> +            as = address_cells[depth-1];
> +            ss = size_cells[depth-1];
> +        }
> +        else
> +        {
> +            as = DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> +            ss = DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> +        }
>  
>          address_cells[depth] = device_tree_get_u32(fdt, node,
>                                                     "#address-cells", as);
> diff --git a/xen/common/libfdt/fdt.c b/xen/common/libfdt/fdt.c
> index 9fe7cf4b74..a507169d29 100644
> --- a/xen/common/libfdt/fdt.c
> +++ b/xen/common/libfdt/fdt.c
> @@ -165,7 +165,7 @@ const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
>  uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  {
>  	const fdt32_t *tagp, *lenp;
> -	uint32_t tag;
> +	uint32_t tag, len;
>  	int offset = startoffset;
>  	const char *p;
>  
> @@ -192,11 +192,11 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
>  		if (!can_assume(VALID_DTB) && !lenp)
>  			return FDT_END; /* premature end */
>  		/* skip-name offset, length and value */
> -		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
> -			+ fdt32_to_cpu(*lenp);
> +		len = fdt32_to_cpu(*lenp);
> +		offset += sizeof(struct fdt_property) - FDT_TAGSIZE + len;
>  		if (!can_assume(LATEST) &&
> -		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
> -		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
> +		    fdt_version(fdt) < 0x10 && len >= 8 &&
> +		    ((offset - len) % 8) != 0)
>  			offset += 4;
>  		break;
>  
> -- 
> 2.25.1
> 

