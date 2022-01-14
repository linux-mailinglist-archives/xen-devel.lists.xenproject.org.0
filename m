Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3648E21C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 02:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257518.442569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8BHV-00029o-Dr; Fri, 14 Jan 2022 01:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257518.442569; Fri, 14 Jan 2022 01:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8BHV-00026A-9k; Fri, 14 Jan 2022 01:21:29 +0000
Received: by outflank-mailman (input) for mailman id 257518;
 Fri, 14 Jan 2022 01:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chGx=R6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n8BHT-0001ZI-Ve
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 01:21:28 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b40c9db-74d8-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 02:21:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64DE2B823E0;
 Fri, 14 Jan 2022 01:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDDAC36AEA;
 Fri, 14 Jan 2022 01:21:24 +0000 (UTC)
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
X-Inumbo-ID: 4b40c9db-74d8-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642123285;
	bh=l2PvEwCyVeWB2hKrqYTRU13dQIFXmY2Q5OOVe208SMA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RPeQWnyawDoF6J/ZNsfv6VcEI3bAw20r8dJXxc1CLyaK81q0lnxRnyZZ1AHAhRrhK
	 BIYblEdPM+BWIZGwIOW3uXtFnnP3mnILc4QArtbO2KmbFC6NJc4KaQ+5VCKCBGJUDd
	 9U23o/jAYFCk729KjiHAPE9WB5uWzL+iql3hSlS3xfhEJuLrD08IMVH9eEXOWcIrdH
	 PrN2i3dXuP8mjU31ZGpMS0umlqlbOQO+3ZFwoK0wQJNSw2SEaxDVcMOgOWfAnbm2Ua
	 +EXzzd4/FZQEvQCVYyjCAI4+OjiUm3fOA3Vd8f9dcmx83NlXoJ9puWrYFCpGZOd1eK
	 CuKYAPUCEiX2A==
Date: Thu, 13 Jan 2022 17:21:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [XEN PATCH v2 1/5] xen: introduce xen,enhanced dom0less
 property
In-Reply-To: <77925E54-B875-4D00-846C-BB957D70BF79@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201131721100.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-1-sstabellini@kernel.org> <77925E54-B875-4D00-846C-BB957D70BF79@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Jan 2022, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Introduce a new "xen,enhanced" dom0less property to enable/disable PV
> > driver interfaces for dom0less guests. Currently only "enabled" and
> > "disabled" are supported property values (and empty). Leave the option
> > open to implement further possible values in the future (e.g.
> > "xenstore" to enable only xenstore.)
> 
> You should also say here that you set this option to true in the code for dom0
> and that the option is only for DomUs.

Good point!
 

> > This patch only parses the property. Next patches will make use of it.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> With the previous added in commit message:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thank you!


> Cheers
> Bertrand
> 
> > ---
> > Changes in v2:
> > - rename kinfo.enhanced to kinfo.dom0less_enhanced
> > - set kinfo.dom0less_enhanced to true for dom0
> > - handle -ENODATA in addition to -EILSEQ
> > ---
> > docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
> > xen/arch/arm/domain_build.c           |  8 ++++++++
> > xen/arch/arm/include/asm/kernel.h     |  3 +++
> > 3 files changed, 29 insertions(+)
> > 
> > diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> > index 71895663a4..38c29fb3d8 100644
> > --- a/docs/misc/arm/device-tree/booting.txt
> > +++ b/docs/misc/arm/device-tree/booting.txt
> > @@ -169,6 +169,24 @@ with the following properties:
> >     Please note that the SPI used for the virtual pl011 could clash with the
> >     physical SPI of a physical device assigned to the guest.
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
> > - nr_spis
> > 
> >     Optional. A 32-bit integer specifying the number of SPIs (Shared
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 6931c022a2..9144d6c0b6 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
> >                                  const struct dt_device_node *node)
> > {
> >     struct kernel_info kinfo = {};
> > +    const char *dom0less_enhanced;
> >     int rc;
> >     u64 mem;
> > 
> > @@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain *d,
> > 
> >     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
> > 
> > +    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
> > +    if ( rc == -EILSEQ ||
> > +         rc == -ENODATA ||
> > +         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
> > +        kinfo.dom0less_enhanced = true;
> > +
> >     if ( vcpu_create(d, 0) == NULL )
> >         return -ENOMEM;
> > 
> > @@ -3095,6 +3102,7 @@ static int __init construct_dom0(struct domain *d)
> > 
> >     kinfo.unassigned_mem = dom0_mem;
> >     kinfo.d = d;
> > +    kinfo.dom0less_enhanced = true;
> > 
> >     rc = kernel_probe(&kinfo, NULL);
> >     if ( rc < 0 )
> > diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> > index 874aa108a7..c4dc039b54 100644
> > --- a/xen/arch/arm/include/asm/kernel.h
> > +++ b/xen/arch/arm/include/asm/kernel.h
> > @@ -36,6 +36,9 @@ struct kernel_info {
> >     /* Enable pl011 emulation */
> >     bool vpl011;
> > 
> > +    /* Enable PV drivers */
> > +    bool dom0less_enhanced;
> > +
> >     /* GIC phandle */
> >     uint32_t phandle_gic;
> > 
> > -- 
> > 2.25.1
> > 
> 

