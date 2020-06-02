Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BF1EC2A8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 21:24:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgCWG-0006Jr-4i; Tue, 02 Jun 2020 19:24:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FM/C=7P=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgCWE-0006Jm-7D
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 19:24:14 +0000
X-Inumbo-ID: a439194e-a506-11ea-8993-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a439194e-a506-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 19:24:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75312206E2;
 Tue,  2 Jun 2020 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591125852;
 bh=CStxKi7GNxsvMOGhzKrkhSxML7SEV2wR10QVNYr+zVQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ytsu3/KDvFSbmo4EBLSvzSQUqp49j6YwqLJF6HIJ0L3/EzovGzwYB4kBfS4zklWFw
 rOp4KdEOMBf/Xy4mOamRhjui9bq7qpePkiL6AyeqnikFIxOsUH8tELfE2ftVujQdPH
 XHHl54Svr0a4OukEQMXivIq0umgf5/xUQUPdZOrc=
Date: Tue, 2 Jun 2020 12:24:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Corey Minyard <minyard@acm.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
In-Reply-To: <20200602183420.GE2880@minyard.net>
Message-ID: <alpine.DEB.2.21.2006021222490.6774@sstabellini-ThinkPad-T480s>
References: <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
 <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
 <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
 <20200602183420.GE2880@minyard.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2140389372-1591125815=:6774"
Content-ID: <alpine.DEB.2.21.2006021223540.6774@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2140389372-1591125815=:6774
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2006021223541.6774@sstabellini-ThinkPad-T480s>

On Tue, 2 Jun 2020, Corey Minyard wrote:
> Snip
> 
> > > > > > whether
> > > > > > this was already done:
> > > > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > > > help
> > > > > > to confirm whether the bug is Xen is related.
> > > > > 
> > > > > Yes it boots
> > > > > 
> > > > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
> > > > > > you try
> > > > > > to disable it? This should help to confirm whether swiotlb is the
> > > > > > problem or
> > > > > > not.
> > > > > 
> > > > > It boots disabling swiotlb-xen
> > > > 
> > > > Thank you for the answer! swiotlb-xen should basically be a NOP for dom0. So
> > > > this suggests swiotlb is doing some transformation on the DMA address.
> > > > 
> > > > I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to assume
> > > > the DMA address space and CPU address space is the same. Is RPI using the
> > > > same address space?
> > > 
> > > Another question, is the DMA request bounced? If so, are we sure the bounce
> > > buffer is in the first GB?
> > 
> > Yes, it is. This is actually where we spent the last few days, and I
> > found another little related bug in the initialization of the
> > swiotlb-xen but now I am sure the memory is under 1GB (0x34000000-0x38000000)
> 
> Was anything ever resolved on this issue?  It just kind of ended for me,
> and I looked in the main kernel and didn't find anything that looked
> related.

Yes, we have a patch series on the list for the Linux kernel to fix this
issue but it hasn't been merged yet:

https://marc.info/?l=linux-kernel&m=159001831406263&w=2
--8323329-2140389372-1591125815=:6774--

