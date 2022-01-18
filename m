Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC474930CB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 23:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258666.445773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9x1s-0005Iy-Fu; Tue, 18 Jan 2022 22:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258666.445773; Tue, 18 Jan 2022 22:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9x1s-0005GR-Bu; Tue, 18 Jan 2022 22:32:40 +0000
Received: by outflank-mailman (input) for mailman id 258666;
 Tue, 18 Jan 2022 22:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZQb=SC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n9x1r-0005GL-5E
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 22:32:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8911c5b9-78ae-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 23:32:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95498612D3;
 Tue, 18 Jan 2022 22:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B637C340E0;
 Tue, 18 Jan 2022 22:32:34 +0000 (UTC)
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
X-Inumbo-ID: 8911c5b9-78ae-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642545155;
	bh=wrKf60ktIkW6VTtuXH9B9S+PIjuTy45WxiJW6NYFq+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hXXVRXM7APKET+taqZFpjFFJU711gXnwXO16qNq/Qhxr7qfSWOMOk+Erlqnu3TnL9
	 F0FBFqkpa8UbuUPSdVD4eu1vhbfAZCytJwfXoYcUxz3uJibGxcftFgNdCOepPvQdqv
	 QYaeOZMeYtvjL+fEa7EP6lRrXIfZpgD/F1zlpTVIQCihh5yXlAUNI/SpOeQWqBvd7I
	 FYyCVrfquyFsoDewNMzABpMWeOLmpYJ0cFLX61t3oB9a/VTuOBlpwDfbqBOoY8Y3Ur
	 OGji3npzcBY0t7kec4PvkHNkxQBIcv/7fmW4uZvtE5Jd4M+fGzQiV9k+wltpL8BuBn
	 tpaJBv54J+mIA==
Date: Tue, 18 Jan 2022 14:32:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Robin Murphy <robin.murphy@arm.com>
cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, devicetree@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: xen: document Xen iommu
 device
In-Reply-To: <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
Message-ID: <alpine.DEB.2.22.394.2201181317570.19362@ubuntu-linux-20-04-desktop>
References: <20220117123251.140867-1-Sergiy_Kibrik@epam.com> <20220117123251.140867-2-Sergiy_Kibrik@epam.com> <e88b882f-4b5d-a801-fc68-66b7f790e11c@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jan 2022, Robin Murphy wrote:
> On 2022-01-17 12:32, Sergiy Kibrik wrote:
> > In IOMMU-capable system hypervisor usually takes over IOMMU control.
> > Generally guest domains don't need to care about IOMMU management and take
> > any
> > extra actions. Yet in some cases a knowledge about which device is protected
> > may be useful for privileged domain.
> > 
> > In compliance with iommu bindings this can be achieved with device-level
> > iommus property specified with dummy Xen iommu device.
> 
> This could break Linux guests, since depending on the deferred probe timeout
> setting it could lead to drivers never probing because the "IOMMU" never
> becomes available.
> 
> Unless you intend to expose actual paravirtualised IOMMU translation
> functionality to guests (in which case virtio-iommu would be highly preferable
> anyway), I don't think this is the right approach. If there's no better
> alternative to using DT to communicate Xen-specific policy, then at least it
> should logically be via a Xen-specific DT property.

Hi Robin,

Let me explain why this is useful and how it differs from something like
virtio-iommu.

When Linux is running as dom0 it uses a swiotlb-based driver to ensure
that DMA operations involving foreign (foreign == owned by other VMs)
pages can work successfully. The driver is drivers/xen/swiotlb-xen.c.
For this discussion the interesting thing about swiotlb-xen is that it
is complex, it can be slow, and it is not actually always needed. You
can imagine that somebody might want to disable swiotlb-xen whenever
possible.

Specifically, if a DMA-capable device is behind an IOMMU, then there is
no need for Linux to use swiotlb-xen.

The problem is that Linux doesn't know when a device is protected by an
IOMMU because the IOMMU is used by Xen and not exposed to Linux.

This bindings is a way for Xen to provide information to Linux, so that
Linux knows when to safely skip swiotlb-xen. It is telling Linux that
the device is protected by an IOMMU, even if Linux is not expected to
use it or do anything with it.

The initial idea was actually to write a Xen-specific DT property for
this. Then a member of the community suggested to re-use the IOMMU
bindings given that after all this is an IOMMU; the only thing special
about it is that the Linux driver is not supposed to do anything with
it. In my mind there should actually be a driver for "xen,iommu-el2-v1"
in Linux, it is just that the driver would "return 0" without doing
anything. (Note that the current patch series doesn't do this as it
turned out not to be currently necessary.)

This is a long way to say that:

1) from my point of view it is also OK to introduce a Xen-specific
   property for this if you think it is best (it doesn't look like it
   would make the code more complex either)
2) at the same time I think that reusing the IOMMU bindings seems fit
   for purpose


In regards to the "deferred probe timeout", I take it wouldn't be an
issue if we use a Xen-specific property instead? Also, would the
presence of an empty IOMMU driver for it (one that just return success
from the probing function without doing anything) solve the problem too?

Thanks for taking a look.

Cheers,

Stefano


> > Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> > ---
> >   Documentation/devicetree/bindings/arm/xen.txt | 26 +++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/xen.txt
> > b/Documentation/devicetree/bindings/arm/xen.txt
> > index db5c56db30ec..98efa95c0d1b 100644
> > --- a/Documentation/devicetree/bindings/arm/xen.txt
> > +++ b/Documentation/devicetree/bindings/arm/xen.txt
> > @@ -58,3 +58,29 @@ Documentation/arm/uefi.rst, which are provided by the
> > regular UEFI stub. However
> >   they differ because they are provided by the Xen hypervisor, together with
> > a set
> >   of UEFI runtime services implemented via hypercalls, see
> >   http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,platform.h.html.
> > +
> > +* XEN IOMMU device
> > +
> > +In compliance with iommu bindings Xen virtual IOMMU device node represents
> > +hypervisor-managed IOMMU [1]. Platform devices specified as IOMMU masters
> > of
> > +this xen-iommu device are protected by hypervisor-managed platform IOMMU.
> > +
> > +Required properties:
> > +
> > +- compatible:	Should be "xen,iommu-el2-v1"
> > +- #iommu-cells: must be 0
> > +
> > +Example:
> > +
> > +xen-iommu {
> > +	compatible = "xen,iommu-el2-v1";
> > +	#iommu-cells = <0>;
> > +};
> > +
> > +video@fe001000 {
> > +	...
> > +	/* this platform device is IOMMU-protected by hypervisor */
> > +	iommus = <&xen-iommu 0x0>;
> > +};
> > +
> > +[1] Documentation/devicetree/bindings/iommu/iommu.txt
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

