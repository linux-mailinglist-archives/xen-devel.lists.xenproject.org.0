Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E431E231166
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 20:14:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0U7O-0000IG-BD; Tue, 28 Jul 2020 18:14:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o87v=BH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k0U7M-0000IB-3d
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 18:14:24 +0000
X-Inumbo-ID: 28cb16c7-d0fe-11ea-a922-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28cb16c7-d0fe-11ea-a922-12813bfff9fa;
 Tue, 28 Jul 2020 18:14:23 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FB9E2070B;
 Tue, 28 Jul 2020 18:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595960062;
 bh=Ji1GHAO1Gn5m+jRIp21fZ0RWs5O53yohkzmTy0JAAqI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JPD7xYi4lTHBB9Rfqm25yKAV5DyXF/IO9C3qQQG1x95wTYVsePitnutw7zGg3yUAD
 OB4BxzkEb82aM9Bl+bc4OgjIKO5zRY7e3Utp0dPD1DWq543zpl+VmqouBpIR+FNidZ
 FEuFRju8LBOHnx6XpwzKZqSGuwGb9Yhjtzlijq5c=
Date: Tue, 28 Jul 2020 11:14:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps
 for Allwinner H6 SoC
In-Reply-To: <e091c32f-d121-d549-a2fa-f906d28ff8f1@arm.com>
Message-ID: <alpine.DEB.2.21.2007281054520.646@sstabellini-ThinkPad-T480s>
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
 <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
 <CA+wirGoG+im2mwb2ye6j4MpcVtfQ-prhhmVgdBTosus7hjeu=w@mail.gmail.com>
 <e091c32f-d121-d549-a2fa-f906d28ff8f1@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-67695330-1595959176=:646"
Content-ID: <alpine.DEB.2.21.2007281059580.646@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alejandro <alejandro.gonzalez.correo@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-67695330-1595959176=:646
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2007281059581.646@sstabellini-ThinkPad-T480s>

On Tue, 28 Jul 2020, André Przywara wrote:
> On 28/07/2020 11:39, Alejandro wrote:
> > Hello,
> > 
> > El dom., 26 jul. 2020 a las 22:25, André Przywara
> > (<andre.przywara@arm.com>) escribió:
> >> So this was actually my first thought: The firmware (U-Boot SPL) sets up
> >> some basic CPU frequency (888 MHz for H6 [1]), which is known to never
> >> overheat the chip, even under full load. So any concern from your side
> >> about the board or SoC overheating could be dismissed, with the current
> >> mainline code, at least. However you lose the full speed, by quite a
> >> margin on the H6 (on the A64 it's only 816 vs 1200(ish) MHz).
> >> However, without the clock entries in the CPU node, the frequency would
> >> never be changed by Dom0 anyway (nor by Xen, which doesn't even know how
> >> to do this).
> >> So from a practical point of view: unless you hack Xen to pass on more
> >> cpu node properties, you are stuck at 888 MHz anyway, and don't need to
> >> worry about overheating.
> > Thank you. Knowing that at least it won't overheat is a relief. But
> > the performance definitely suffers from the current situation, and
> > quite a bit. I'm thinking about using KVM instead: even if it does
> > less paravirtualization of guests,
> 
> What is this statement based on? I think on ARM this never really
> applied, and in general whether you do virtio or xen front-end/back-end
> does not really matter. IMHO any reasoning about performance just based
> on software architecture is mostly flawed (because it's complex and
> reality might have missed some memos ;-) So just measure your particular
> use case, then you know.
> 
> > I'm sure that the ability to use
> > the maximum frequency of the CPU would offset the additional overhead,
> > and in general offer better performance. But with KVM I lose the
> > ability to have individual domU's dedicated to some device driver,
> > which is a nice thing to have from a security standpoint.
> 
> I understand the theoretical merits, but a) does this really work on
> your board and b) is this really more secure? What do you want to
> protect against?

For "does it work on your board", the main obstacle is typically IOMMU
support to be able to do device assignment properly. That's definitely
something to check. If it doesn't work nowadays you can try to
workaround it by using direct 1:1 memory mappings [1].  However, for
security then you have to configure a MPU. I wonder if H6 has a MPU and
how it can be configured. In any case, something to keep in mind in case
the default IOMMU-based setup doesn't work for some reason for the
device you care about.

For "is this really more secure?", yes it is more secure as you are
running larger portions of the codebase in unprivileged mode and isolated
from each other with IOMMU (or MPU) protection. See what the OpenXT and
Qubes OS guys have been doing.


[1] https://marc.info/?l=xen-devel&m=158691258712815
--8323329-67695330-1595959176=:646--

