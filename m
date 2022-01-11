Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC31C48BB33
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 00:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256180.439513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7QAq-0007Kb-Ao; Tue, 11 Jan 2022 23:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256180.439513; Tue, 11 Jan 2022 23:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7QAq-0007Hl-6E; Tue, 11 Jan 2022 23:03:28 +0000
Received: by outflank-mailman (input) for mailman id 256180;
 Tue, 11 Jan 2022 23:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMx1=R3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7QAo-0007Hf-7O
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 23:03:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad4c5553-7332-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 00:03:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 082BC61019;
 Tue, 11 Jan 2022 23:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E223C36AE3;
 Tue, 11 Jan 2022 23:03:22 +0000 (UTC)
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
X-Inumbo-ID: ad4c5553-7332-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641942202;
	bh=YusIJKuNpQW2f5SElceawFfbU7s1N1XoWdUV5HpZshs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dIDQFzfQPY584JBW3MUGJyUBm2CfnyB0WgVhD/RDeJ0wEHUrJMDb7KyJWeifR11s5
	 M8r/tQuNNsNLB9kQkonZSjI+nZWjkgRfPXB096ZM5qHUrRfYIsLrq1QU/09ngOONff
	 +Br4K1EdUHOPdvWpvX0SY2YIeywHsa2jYMsRg7NPaZ71R7EA/HA5MbDQ8yOHtg5/cq
	 qGYV5s0uRV7OeeLPP+9l43345GmslhxJIHcbzOrVfQgARRAXUjt8t15lVClPp8Lr9b
	 ohGjQZ1DSGkZgO7YJ+x0Gkd7qQ/YYnrJ+CUHhP/NbYA/cQQIgd4PaRGU+gVKjJu+ls
	 XeJj3qrlRCI4w==
Date: Tue, 11 Jan 2022 15:03:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [XEN PATCH 4/7] xen: introduce xen,enhanced dom0less property
In-Reply-To: <87o84jx81g.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2201111452340.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop> <20220108004912.3820176-4-sstabellini@kernel.org> <87o84jx81g.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Jan 2022, Volodymyr Babchuk wrote:
> Hi Stefano,
> 
> Stefano Stabellini <sstabellini@kernel.org> writes:
> 
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >
> > Introduce a new "xen,enhanced" dom0less property to enable/disable PV
> > driver interfaces for dom0less guests. Currently only "enabled" and
> > "disabled" are supported property values (and empty). Leave the option
> > open to implement further possible values in the future (e.g.
> > "xenstore" to enable only xenstore.)
> >
> > This patch only parses the property. Next patches will make use of it.
> >
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> >  docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
> >  xen/arch/arm/domain_build.c           |  5 +++++
> >  xen/arch/arm/include/asm/kernel.h     |  3 +++
> >  3 files changed, 26 insertions(+)
> >
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index 71895663a4..38c29fb3d8 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -169,6 +169,24 @@ with the following properties:
> >      Please note that the SPI used for the virtual pl011 could clash with the
> >      physical SPI of a physical device assigned to the guest.
> >  
> > +- xen,enhanced
> > +
> > +    A string property. Possible property values are:
> > +
> > +    - "enabled" (or missing property value)
> > +    Xen PV interfaces, including grant-table and xenstore, will be
> > +    enabled for the VM.
> > +
> > +    - "disabled"
> > +    Xen PV interfaces are disabled.
> > +
> > +    If the xen,enhanced property is present with no value, it defaults
> > +    to "enabled". If the xen,enhanced property is not present, PV
> > +    interfaces are disabled.
> > +
> > +    In the future other possible property values might be added to
> > +    enable only selected interfaces.
> > +
> >  - nr_spis
> >  
> >      Optional. A 32-bit integer specifying the number of SPIs (Shared
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 6931c022a2..96a94fa434 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
> >                                   const struct dt_device_node *node)
> >  {
> >      struct kernel_info kinfo = {};
> > +    const char *enhanced;
> >      int rc;
> >      u64 mem;
> >  
> > @@ -2978,6 +2979,10 @@ static int __init construct_domU(struct domain *d,
> >  
> >      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
> >  
> > +    rc = dt_property_read_string(node, "xen,enhanced", &enhanced);
> > +    if ( rc == -EILSEQ || (rc == 0 && !strcmp(enhanced, "enabled")) )
> 
> Are you sure you need to check for -EILSEQ?
> 
> >From documentation for dt_property_read_string:
> 
>  * Returns 0 on
>  * success, -EINVAL if the property does not exist, -ENODATA if property
>  * doest not have value, and -EILSEQ if the string is not
>  * null-terminated with the length of the property data.
> 
> So, for me it looks like you need to check for -ENODATA.

That's interesting, I ran a few tests with:

  fdt set /chosen/domU0 xen,enhanced

and I keep getting:

  (XEN) DEBUG construct_domU 3009 rc=-84 val=<NULL>

And -84 is -EILSEQ.

So I'll check for both -EILSEQ and -ENODATA to be safe.

 
> 
> > +        kinfo.enhanced = true;
> > +
> >      if ( vcpu_create(d, 0) == NULL )
> >          return -ENOMEM;
> >  
> > diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> > index 874aa108a7..3275f7fbca 100644
> > --- a/xen/arch/arm/include/asm/kernel.h
> > +++ b/xen/arch/arm/include/asm/kernel.h
> > @@ -36,6 +36,9 @@ struct kernel_info {
> >      /* Enable pl011 emulation */
> >      bool vpl011;
> >  
> > +    /* Enable PV drivers */
> > +    bool enhanced;
> 
> Maybe dom0less_enhanced will be better name?

I am OK with that and maybe you are right, it is clearer. I'll keep the
device tree option as "xen,enhanced" unless you meant to also change
that too.


> Or what about dom0? Should it have this option enabled?

Yes, I think it makes sense to set it to true for dom0 too for
consistency.


