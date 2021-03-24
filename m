Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE98348585
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 00:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101226.193448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPDEs-0003im-2M; Wed, 24 Mar 2021 23:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101226.193448; Wed, 24 Mar 2021 23:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPDEr-0003iR-VH; Wed, 24 Mar 2021 23:48:37 +0000
Received: by outflank-mailman (input) for mailman id 101226;
 Wed, 24 Mar 2021 23:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z1F8=IW=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1lPDEp-0003iM-3M
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 23:48:36 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc634cdb-2ec8-40e4-aaa5-02f1cf06dca3;
 Wed, 24 Mar 2021 23:48:31 +0000 (UTC)
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPDEj-000Md7-39; Wed, 24 Mar 2021 23:48:29 +0000
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
X-Inumbo-ID: bc634cdb-2ec8-40e4-aaa5-02f1cf06dca3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=ZJXD/N6Limea4VVe7VOWBTx+vFdyKJO0h1A/Bqz0JPM=; b=YimCoJfEn9q9hWPDvfqNN8z3bL
	iyx/rtx7cG5GX+PQYb2Pyz5Kz8VBNSabBZWA4CtG636S1rQjxXDSzGZrP0Yr1Rcu/nOT2PE4irH97
	a6AaQ5MC8GzgWSaz7e2z4+xMfFr1YVySh8luGRENKsNpQfXwqO2VduXUu6HHINxFrVhoSMKJVghQF
	WyZ4lABxpwV0jhG/viOVsa9MuarnHHtWAaqUa89dvCWKLM6Yr7V7Fvywo+KMTwh3ECXMkHOhLQ6FW
	64yUTRfuNjtza7DC9jC50/aUdZ1MuoPcx7pAzKiXxRJalDfMkZXxfBd5s7Y0/wkrThCBIlts2A34E
	czfQ991g==;
Subject: Re: [PATCH V2] ARM: xen/mm.c: A mundane typo fix
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, sstabellini@kernel.org,
 linux@armlinux.org.uk, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210325043526.16289-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e3980acb-e6d7-645a-3be0-79cea6f2fd8e@infradead.org>
Date: Wed, 24 Mar 2021 16:48:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210325043526.16289-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/24/21 9:35 PM, Bhaskar Chowdhury wrote:
> s/acrros/across/
> 
> Plus some words need prural version...so did it.(page->pages)
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Changes from V1:
>   Randy's findings incorporated.
> 
>  arch/arm/xen/mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 467fa225c3d0..8596dd32dcd5 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -105,8 +105,8 @@ bool xen_arch_need_swiotlb(struct device *dev,
>  	 *	- The Linux page refers to foreign memory
>  	 *	- The device doesn't support coherent DMA request
>  	 *
> -	 * The Linux page may be spanned acrros multiple Xen page, although
> -	 * it's not possible to have a mix of local and foreign Xen page.
> +	 * The Linux page may be spanned across multiple Xen pages, although
> +	 * it's not possible to have a mix of local and foreign Xen pages.
>  	 * Furthermore, range_straddles_page_boundary is already checking
>  	 * if buffer is physically contiguous in the host RAM.
>  	 *
> --


-- 
~Randy


