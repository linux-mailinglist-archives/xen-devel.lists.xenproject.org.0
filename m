Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDF5A0390
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 00:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392959.631620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQyPP-00070g-Vp; Wed, 24 Aug 2022 21:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392959.631620; Wed, 24 Aug 2022 21:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQyPP-0006ww-T0; Wed, 24 Aug 2022 21:59:35 +0000
Received: by outflank-mailman (input) for mailman id 392959;
 Wed, 24 Aug 2022 21:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NROC=Y4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oQyPN-0006wq-Jk
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 21:59:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07c6d2ac-23f8-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 23:59:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A490B8256B;
 Wed, 24 Aug 2022 21:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CFFC433D6;
 Wed, 24 Aug 2022 21:59:28 +0000 (UTC)
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
X-Inumbo-ID: 07c6d2ac-23f8-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661378369;
	bh=ktgXbAcGHo/wdVZcX56uHkh+2VfTILJr43kDfUbT0sM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tCcAbC5KZ3Dm5/BOWbiIEpjMz6TjGCJh/qUnb0BpqHsqUHDNrEHWMvd3/GoxtzquX
	 +8Ag1DLrt3B/yFCyj6NYjB+Bz2f1+hFaJNuBC0dKmf8kPbjJ+tNAGLFx+31aE2M6am
	 eTbpWqSndDFl98vBlFf1xaoJjeIxJg3qq6uebaYRaGUvfvnnHuuI+Ho+7j6pKQ59mm
	 ypmndC01wbcI0m/GlUf5yhqQNmp0/9Tv0yxp7lKk0G9Ymb8/nPxMDEGyZGxCAmEekK
	 UEHUyvrMPxnqEVCo7/EqBzwFgthkd/xGvsDLzcZ7Rq/IBx+x1kpzzyG4GeRkDeS5+C
	 oNo6blsIrXYJQ==
Date: Wed, 24 Aug 2022 14:59:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
In-Reply-To: <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
Message-ID: <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
References: <cover.1660902588.git.rahul.singh@arm.com> <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com> <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org> <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com> <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com> <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org> <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-317901848-1661377239=:15247"
Content-ID: <alpine.DEB.2.22.394.2208241440580.15247@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-317901848-1661377239=:15247
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2208241440581.15247@ubuntu-linux-20-04-desktop>

On Wed, 24 Aug 2022, Rahul Singh wrote:
> > On 24 Aug 2022, at 4:36 pm, Julien Grall <julien@xen.org> wrote:
> > On 24/08/2022 15:42, Rahul Singh wrote:
> >>> On 24 Aug 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
> >>> 
> >>> 
> >>> 
> >>> On 24/08/2022 13:15, Rahul Singh wrote:
> >>>> Hi Julien,
> >>> 
> >>> Hi Rahul,
> >>> 
> >>>> Please let me know your view on this.
> >>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> >>>> index bfe7bc6b36..a1e23eee59 100644
> >>>> --- a/xen/arch/arm/domain_build.c
> >>>> +++ b/xen/arch/arm/domain_build.c
> >>>> @@ -3562,12 +3562,7 @@ static int __init construct_domU(struct domain *d,
> >>>>    if ( rc == -EILSEQ ||
> >>>>      rc == -ENODATA ||
> >>>>      (rc == 0 && !strcmp(dom0less_enhanced, “enabled”)) )
> >>>> -  {
> >>>> -    if ( hardware_domain )
> >>>>        kinfo.dom0less_enhanced = true;
> >>>> -    else
> >>>> -      panic(“Tried to use xen,enhanced without dom0\n”);
> >>>> -  }
> >>> 
> >>> You can't use "xen,enhanced" without dom0. In fact, you will end up to dereference NULL in alloc_xenstore_evtchn(). That's because "xen,enhanced" means the domain will be able to use Xenstored.
> >>> 
> >>> Now if you want to support your feature without a dom0. Then I think we want to introduce an option which would be the same as "xen,enhanced" but doesn't expose Xenstored.
> >> If we modify the patch as below we can use the "xen,enhanced" for domUs without dom0.
> >> I tested the patch and its works fine. Do you see any issue with this approach?
> > 
> > Yes. For two reasons:
> > 1) It is muddying the meaning of "xen,enhanced". In particular a user may not realize that Xenstore is not available if dom0 is not present.
> > 2) It would be more complicated to handle the case where Xenstored lives in a non-dom0 domain. I am not aware of anyone wanting this on Arm yet, but I don't want to close the door.
> > 
> > So if you want to support create "xen,xen" without all the rest. Then I think we need a different property value. I don't have a good suggestion for the name.
> 
> Is that okay if we use the earlier approach, when user set  "xen,enhanced = evtchn” we will not call alloc_xenstore_evtchn()  
> but we create hypervisor node with all fields.

Thinking more about this, today xen,enhanced has the implication that:

- the guest will get a regular and complete "xen,xen" node in device tree
- xenstore and PV drivers will be available (full Xen interfaces support)

We don't necessarely imply that dom0 is required (from a domU point of
view) but we do imply that xenstore+evtchn+gnttab will be available to
the domU.

Now, static event channels are different. They don't require xenstore
and they don't require gnttab.

It is as if the current xen,enhanced node actually meant:

  xen,enhanced = "xenstore,gnttab,evtchn";

and now we are only enabling a subset:

  xen,enhanced = "evtchn";

Is that a correct understanding?


If so, we can clarify that:

  xen,enhanced;

it is a convenient shortend for:

  xen,enhanced = "xenstore,gnttab,evtchn";

and that other combinations are also acceptable, e.g.:

  xen,enhanced = "gnttab";
  xen,enhanced = "evtchn";
  xen,enhanced = "evtchn,gnttab";

It is OK to panic if the user specifies an option that is currently
unsupported (e.g. "gnttab").

In practice xenstore requires both gnttab and evtchn, I don't know if we
want to write that down in the device tree bindings. We could panic if
the user specifies: xen,enhanced = "xenstore,evtchn";

What do you guys think?
--8323329-317901848-1661377239=:15247--

