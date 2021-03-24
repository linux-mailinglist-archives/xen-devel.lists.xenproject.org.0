Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E50348146
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 20:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101159.193293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8un-0000kD-PM; Wed, 24 Mar 2021 19:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101159.193293; Wed, 24 Mar 2021 19:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP8un-0000jl-M7; Wed, 24 Mar 2021 19:11:37 +0000
Received: by outflank-mailman (input) for mailman id 101159;
 Wed, 24 Mar 2021 19:11:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDsp=IW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lP8ul-0000jf-Ka
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 19:11:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a34c8095-e3f6-4e24-9462-ec5297360779;
 Wed, 24 Mar 2021 19:11:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D565361A17;
 Wed, 24 Mar 2021 19:11:33 +0000 (UTC)
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
X-Inumbo-ID: a34c8095-e3f6-4e24-9462-ec5297360779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616613094;
	bh=dgMYdzjGstqyJTgn4iNkiVn6WwtSS/vzrce0N9MVCIA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s+1KonQi/HxRdY9BH380c5qSw+4yfBNi00WS9WVl7W7UiS7MOoOTSs8RGFPY1u+1L
	 CX+JKmVGywbw/xrL21gfKU5DxdEA1TBXH8XEs/1GixAIegYlu4zjKerqesGyCkqv08
	 7L+hbVE8fh2M0bqqKPStJLIvUjyGVRl1rXVvDL4g6mChkVMZjjd/6GqLd9UZR9om+v
	 T7pcMgDj4BZq32cBvO202aLGa4UXzHstcauJdcX0t2BHQv5dtUf3giZpsszunKbwDS
	 9KO9UMlhfjhI/0boT2b5qzgdFOXibilxQXnAGYuWcO/e5SE/oUEeiZOucOXqGO+YmP
	 hcFq52bXLQ8qg==
Date: Wed, 24 Mar 2021 12:11:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Randy Dunlap <rdunlap@infradead.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bhaskar Chowdhury <unixbhaskar@gmail.com>, linux@armlinux.org.uk, 
    xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com
Subject: Re: [PATCH] ARM: xen/mm.c: A mundane typo fix
In-Reply-To: <5e1b573a-6dc7-7f28-28ae-c509e6782fbf@infradead.org>
Message-ID: <alpine.DEB.2.21.2103241203140.439@sstabellini-ThinkPad-T480s>
References: <20210324133036.17665-1-unixbhaskar@gmail.com> <alpine.DEB.2.21.2103241154320.439@sstabellini-ThinkPad-T480s> <5e1b573a-6dc7-7f28-28ae-c509e6782fbf@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Mar 2021, Randy Dunlap wrote:
> On 3/24/21 11:55 AM, Stefano Stabellini wrote:
> > On Wed, 24 Mar 2021, Bhaskar Chowdhury wrote:
> >> s/acrros/across/
> >>
> >> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > 
> 
> Hi,
> It seems to me like some of those "page" should be "pages".

Yes, good point actually


> >> ---
> >>  arch/arm/xen/mm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> >> index 467fa225c3d0..be7c942c74bf 100644
> >> --- a/arch/arm/xen/mm.c
> >> +++ b/arch/arm/xen/mm.c
> >> @@ -105,7 +105,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
> >>  	 *	- The Linux page refers to foreign memory
> >>  	 *	- The device doesn't support coherent DMA request
> >>  	 *
> >> -	 * The Linux page may be spanned acrros multiple Xen page, although>> +	 * The Linux page may be spanned across multiple Xen page, although
> 
> 	                                                     pages,
> 
> >>  	 * it's not possible to have a mix of local and foreign Xen page.
> 
> 	                                                            pages.

yes to both


> >>  	 * Furthermore, range_straddles_page_boundary is already checking
> >>  	 * if buffer is physically contiguous in the host RAM.
> >> --
> 
> 
> -- 
> ~Randy
> 

