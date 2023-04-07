Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF86DB5CF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Apr 2023 23:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519089.806272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkthr-0004wg-AQ; Fri, 07 Apr 2023 21:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519089.806272; Fri, 07 Apr 2023 21:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkthr-0004tH-7V; Fri, 07 Apr 2023 21:33:15 +0000
Received: by outflank-mailman (input) for mailman id 519089;
 Fri, 07 Apr 2023 21:33:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEkE=76=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pkthp-0004t6-Dn
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 21:33:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9901076-d58b-11ed-b464-930f4c7d94ae;
 Fri, 07 Apr 2023 23:33:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5148D654EC;
 Fri,  7 Apr 2023 21:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D73C433D2;
 Fri,  7 Apr 2023 21:33:05 +0000 (UTC)
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
X-Inumbo-ID: c9901076-d58b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680903186;
	bh=KgPVxGeJyjHgHWJ1MvOr151jsd1aMT+s+wUu8MCW3MA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=amCe+dN+/bqX1XCsKNLagV3HpIosJbF9FlPy2W51kopEMdLznuiUZF+oveoR+86Sq
	 qXYze2QyhfQOP6pC6wdmzAsxe50fv6TXFNsN6fI7uscQB4pPNpkxyhIrhzXUHCVy/c
	 ioxWxo1YIGRX3533z9pzWXSW/82P2ILXsUyKYHx1y9FhEBfjgduhQb+G5ZS2zwHA8/
	 JJ7GicQKB1RmOnnKHLdrXnZgXVg9DWjMh7koEGhcAMc1hh327Xyb6k2DiZp4Y7Gzvf
	 3aNK1gFBTeIlU76UA1f7Kshq0DHQMKgHV7LKMq7L2rAQdGAQtjXmYnEZzeAjphe304
	 y0GAafVn2dicg==
Date: Fri, 7 Apr 2023 14:33:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: vpl011: Fix misleading comments
In-Reply-To: <7dc2a51a-f1bd-6370-6b42-0bcf1adad619@amd.com>
Message-ID: <alpine.DEB.2.22.394.2304071432510.111906@ubuntu-linux-20-04-desktop>
References: <20230405111750.12491-1-michal.orzel@amd.com> <20230405111750.12491-2-michal.orzel@amd.com> <7dc2a51a-f1bd-6370-6b42-0bcf1adad619@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Apr 2023, Ayan Kumar Halder wrote:
> On 05/04/2023 12:17, Michal Orzel wrote:
> > In both vpl011_read_data() and vpl011_read_data_xen(), there is a comment
> > stating that the guest is expected to read the DR register only if the
> > TXFE bit of FR register is not set. This is obviously logically wrong and
> > it should be RXFE (i.e. RX FIFO empty bit set -> nothing to read).
> NIT:- I will prefer if the PL011 TRM is mentioned with the relevant section.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> >   xen/arch/arm/vpl011.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> > index 2fa80bc15ac4..0186d8a31834 100644
> > --- a/xen/arch/arm/vpl011.c
> > +++ b/xen/arch/arm/vpl011.c
> > @@ -143,8 +143,8 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
> >       /*
> >        * It is expected that there will be data in the ring buffer when this
> >        * function is called since the guest is expected to read the data
> > register
> > -     * only if the TXFE flag is not set.
> > -     * If the guest still does read when TXFE bit is set then 0 will be
> > returned.
> > +     * only if the RXFE flag is not set.
> > +     * If the guest still does read when RXFE bit is set then 0 will be
> > returned.
> >        */
> >       if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) > 0 )
> >       {
> > @@ -202,8 +202,8 @@ static uint8_t vpl011_read_data(struct domain *d)
> >       /*
> >        * It is expected that there will be data in the ring buffer when this
> >        * function is called since the guest is expected to read the data
> > register
> > -     * only if the TXFE flag is not set.
> > -     * If the guest still does read when TXFE bit is set then 0 will be
> > returned.
> > +     * only if the RXFE flag is not set.
> > +     * If the guest still does read when RXFE bit is set then 0 will be
> > returned.
> >        */
> >       if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) > 0 )
> >       {
> 

