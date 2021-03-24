Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D6F348109
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 19:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101142.193245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8fL-0006nx-Gw; Wed, 24 Mar 2021 18:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101142.193245; Wed, 24 Mar 2021 18:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8fL-0006nY-D5; Wed, 24 Mar 2021 18:55:39 +0000
Received: by outflank-mailman (input) for mailman id 101142;
 Wed, 24 Mar 2021 18:55:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDsp=IW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lP8fK-0006nT-1p
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 18:55:38 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40a2ba72-499d-430a-809a-a48a64d838a6;
 Wed, 24 Mar 2021 18:55:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5E8861A0A;
 Wed, 24 Mar 2021 18:55:35 +0000 (UTC)
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
X-Inumbo-ID: 40a2ba72-499d-430a-809a-a48a64d838a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616612136;
	bh=39W/A/1MQN2qtx5XidDcwhzMqYmkDys9KGwGNqwlSLM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dyOVzEDFOTG/8Rmm24H7HWnMKg7Hnvl/oPc0YO55xsLglGs7Rxm0pCXMlg8wXW5Mp
	 Rl9SayRFv2Qu9u4paCNpJ8nQUV1zJwH55TtFyLY6gsulID3avz1k07SXQVrJakHrm3
	 qw9XT/YrtqBxeOpp9oGiZF5Ap4IH20w5U19fGmgt80j1jJu8/fWXekPNGLpSMEkz/g
	 ePo77yCta25T3uMGNVfaKnSQnPrC9DaEQkmJFSY67X9d8DajUvUWMCI4/06PhzeWYy
	 85GFOYI+4Z5YlzqyYq7UoIni/Ni7khuzS6N0s3Cjccrs/fCCnFzpZ0AnDky3VpqCUp
	 Z0nLWSBBHU86w==
Date: Wed, 24 Mar 2021 11:55:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
cc: sstabellini@kernel.org, linux@armlinux.org.uk, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, rdunlap@infradead.org, jgross@suse.com, 
    boris.ostrovsky@oracle.com
Subject: Re: [PATCH] ARM: xen/mm.c: A mundane typo fix
In-Reply-To: <20210324133036.17665-1-unixbhaskar@gmail.com>
Message-ID: <alpine.DEB.2.21.2103241154320.439@sstabellini-ThinkPad-T480s>
References: <20210324133036.17665-1-unixbhaskar@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Mar 2021, Bhaskar Chowdhury wrote:
> s/acrros/across/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  arch/arm/xen/mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 467fa225c3d0..be7c942c74bf 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -105,7 +105,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
>  	 *	- The Linux page refers to foreign memory
>  	 *	- The device doesn't support coherent DMA request
>  	 *
> -	 * The Linux page may be spanned acrros multiple Xen page, although
> +	 * The Linux page may be spanned across multiple Xen page, although
>  	 * it's not possible to have a mix of local and foreign Xen page.
>  	 * Furthermore, range_straddles_page_boundary is already checking
>  	 * if buffer is physically contiguous in the host RAM.
> --
> 2.30.1
> 

