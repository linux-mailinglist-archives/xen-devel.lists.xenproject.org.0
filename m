Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9D648E0B9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 00:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257441.442312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n896e-0007PO-8a; Thu, 13 Jan 2022 23:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257441.442312; Thu, 13 Jan 2022 23:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n896e-0007NG-4f; Thu, 13 Jan 2022 23:02:08 +0000
Received: by outflank-mailman (input) for mailman id 257441;
 Thu, 13 Jan 2022 23:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n896d-0007NA-BH
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 23:02:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3703ea5-74c4-11ec-a563-1748fde96b53;
 Fri, 14 Jan 2022 00:02:05 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A7AB361CB0;
 Thu, 13 Jan 2022 23:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE067C36AEA;
 Thu, 13 Jan 2022 23:02:03 +0000 (UTC)
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
X-Inumbo-ID: d3703ea5-74c4-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642114924;
	bh=pIn/nxbNCm7QHmhvPrf1o5yCVQz54kQSHoiTG2MkYuU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uXinYRj45/T5fwLulcJ3SEcQMAj58al1pJkkLGWeyWmBpoK51l9vMmJ74A3Dgxpre
	 OgW+QB/Xfr4h5d2zdGu4RH1FJLt9SuxHIzuN6Glv8pAhrqWTPLeNNSw01zO03rtZyv
	 Fqw/rgU/AjvwAnNyL9/66C6RgQwGedzj3lek0JCrV7HKq4KoKjZoJ1fzxvpVpaSULe
	 riAI8SvyfPTMjmcSSzI/9zMyPsMWBCtl2AgMw97RarA1ZEAMGaH8SxtKVH7Usz8IYs
	 OMDUn1a5ggzxJsbW+YEixD1pEvE4tYUGfyuK5lOM5HSb34H+ovrj1S+bbtQn9MfaLa
	 hIhKf60YqT8xw==
Date: Thu, 13 Jan 2022 15:02:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Juergen Gross <jgross@suse.com>, Bertrand.Marquis@arm.com, julien@xen.org, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [XEN PATCH v2 1/5] xen: introduce xen,enhanced dom0less
 property
In-Reply-To: <C435312C-1697-4D7D-8F7A-E7BFFA8AED38@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201131456530.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop> <20220113005855.1180101-1-sstabellini@kernel.org> <C435312C-1697-4D7D-8F7A-E7BFFA8AED38@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1653450377-1642114923=:19362"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1653450377-1642114923=:19362
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Jan 2022, Luca Fancellu wrote:
> > On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
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
> 
> Hi Stefano,
> 
> Subject to Bertrand’s comment on commit message:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> Just a small curiosity, why we use the prefix “xen,” for the property? I thought since the node uses
> a “xen,domain" compatible we could use just “enhanced” just like the other properties “vpl011”, “nr_spis”, ...

Julien was the one to suggest the naming but I actually like it.

Yes, if we wanted we could use "enhanced" but I think it is a better
idea to call this property "xen,enhanced" because that way it is easily
distinguishable from properties that could be hypervisor-neutral.

Imagine one day we have a device tree spec for a generic hypervisor
domain. It could have things like memory and even vpl011. However, for
sure it is not going to have "Xen PV drivers enabled". From a device
tree perspective it is better to align properties as much as possible
between similar nodes of different vendors, so ideally "memory" is going
ot be called "memory" for all hypervisor vendors. So it makes sense for
this property to have the "xen," prefix as it is different from the ones
that are more neutral.


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
> > 
> 
--8323329-1653450377-1642114923=:19362--

