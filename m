Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84370207A42
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 19:29:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo9Cp-0004DI-Vs; Wed, 24 Jun 2020 17:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z21m=AF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jo9Cn-0004DD-Ow
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 17:29:01 +0000
X-Inumbo-ID: 3145f9ca-b640-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3145f9ca-b640-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 17:29:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45E872078D;
 Wed, 24 Jun 2020 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593019740;
 bh=VQBPgH331hw6VJmPWcybMgyEHppdU/GjfLhtKGyKFBU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kqwT8GSK6zkaZ2rwPbU7buMudcQZyfi06sTZb8a7M52z7V40+iZzni0Od3Zm8Jm65
 dLsEcUoiBQ4V5jXd1+NmDbbZur05SRcVvviMioDzQsWbhq5bRvq6E+ps+QFB2qOCkh
 sfagmcy2SK3XRc5ffbUKEeeYnDXxUCvDVzGzQu3U=
Date: Wed, 24 Jun 2020 10:28:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Keystone Issue
In-Reply-To: <30ACA5A7-089F-45E2-9A9B-A6BC4EBBC78B@arm.com>
Message-ID: <alpine.DEB.2.21.2006241027180.8121@sstabellini-ThinkPad-T480s>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
 <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
 <4bab90465acfddae5868ce2311bd9889@kernel.org>
 <CALYbLDjNF5s2SXkunjJNv4x9jQAcDfoMBWp3WFHBkjnNdfT3Sg@mail.gmail.com>
 <bd3fade765bf21342a4ce6b952a5ca00@kernel.org>
 <CALYbLDhbRO=FeK21FLTMbt=eMciTW4hhjJUVhpmPUJ0D1ELeqA@mail.gmail.com>
 <alpine.DEB.2.21.2006171134350.14005@sstabellini-ThinkPad-T480s>
 <CALYbLDjX=aDTT0oazOkSDthd_p1H2ygunbdur935+2HYpF5Pow@mail.gmail.com>
 <CALYbLDj9SCmxPZN1Tn6+YntkFyD69iKo2AGq=tG2Cnx4o=PBtg@mail.gmail.com>
 <30ACA5A7-089F-45E2-9A9B-A6BC4EBBC78B@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 CodeWiz2280 <codewiz2280@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 24 Jun 2020, Bertrand Marquis wrote:
> > On 23 Jun 2020, at 21:50, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > 
> > Is it possible to passthrough PCI devices to domU on the 32-bit arm
> > keystone?  Any info is appreciated.
> > 
> > I found some old information online that "gic-v2m" is required.  I'm
> > not sure if the GIC-400 on the K2E supports "gic_v2m".  Based on the
> > fact that there is no "gic-v2m-frame" tag in the K2E device tree i'm
> > guessing that it does not.
> > 
> > If it is possible, is there a good example for arm that I can follow?
> 
> There is no PCI passthrough support on Arm for now in Xen.
> 
> This is something I am working on and I will present something on this subject at the Xen summit.
> But we are not targeting arm32 for now.
> 
> The only thing possible for now is to have PCI devices handled by Dom0 and using xen virtual drivers to pass the functionalities (ethernet, block or others).

It should also possible to pass the entire PCI controller, together with
the whole aperture and all interrupts to a domU. The domU would get all
PCI devices this way, not just one.


 
> > On Wed, Jun 17, 2020 at 7:52 PM CodeWiz2280 <codewiz2280@gmail.com> wrote:
> >> 
> >> On Wed, Jun 17, 2020 at 2:46 PM Stefano Stabellini
> >> <sstabellini@kernel.org> wrote:
> >>> 
> >>> On Wed, 17 Jun 2020, CodeWiz2280 wrote:
> >>>> On Tue, Jun 16, 2020 at 2:23 PM Marc Zyngier <maz@kernel.org> wrote:
> >>>>> 
> >>>>> On 2020-06-16 19:13, CodeWiz2280 wrote:
> >>>>>> On Tue, Jun 16, 2020 at 4:11 AM Marc Zyngier <maz@kernel.org> wrote:
> >>>>>>> 
> >>>>>>> On 2020-06-15 20:14, CodeWiz2280 wrote:
> >>>>>>> 
> >>>>>>> [...]
> >>>>>>> 
> >>>>>>>> Also, the latest linux kernel still has the X-Gene storm distributor
> >>>>>>>> address as "0x78010000" in the device tree, which is what the Xen code
> >>>>>>>> considers a match with the old firmware.  What were the addresses for
> >>>>>>>> the device tree supposed to be changed to?
> >>>>>>> 
> >>>>>>> We usually don't care, as the GIC address is provided by the
> >>>>>>> bootloader,
> >>>>>>> whether via DT or ACPI (this is certainly what happens on Mustang).
> >>>>>>> Whatever is still in the kernel tree is just as dead as the platform
> >>>>>>> it
> >>>>>>> describes.
> >>>>>>> 
> >>>>>>>> Is my understanding
> >>>>>>>> correct that there is a different base address required to access the
> >>>>>>>> "non-secure" region instead of the "secure" 0x78010000 region?  I'm
> >>>>>>>> trying to see if there are corresponding different addresses for the
> >>>>>>>> keystone K2E, but haven't found them yet in the manuals.
> >>>>>>> 
> >>>>>>> There is no such address. Think of the NS bit as an *address space*
> >>>>>>> identifier.
> >>>>>>> 
> >>>>>>> The only reason XGene presents the NS part of the GIC at a different
> >>>>>>> address is because XGene is broken enough not to have EL3, hence no
> >>>>>>> secure mode. To wire the GIC (and other standard ARM IPs) to the core,
> >>>>>>> the designers simply used the CPU NS signal as an address bit.
> >>>>>>> 
> >>>>>>> On your platform, the NS bit does exist. I strongly suppose that it
> >>>>>>> isn't wired to the GIC. Please talk to your SoC vendor for whether iot
> >>>>>>> is possible to work around this.
> >>>>>>> 
> >>>>>> I do have a question about this out to TI, but at least this method
> >>>>>> gives me something to work with in the meantime.  I was just looking
> >>>>>> to confirm that there wouldn't be any other undesirable side effects
> >>>>>> with Dom0 or DomU when using it.  Was there an actual FPGA for the
> >>>>>> X-Gene that needed to be updated which controlled the GIC access?  Or
> >>>>>> by firmware do you mean the boot loader (e.g. uboot).  Thanks for the
> >>>>>> support so far to all.
> >>>>> 
> >>>>> As I said, the specific case of XGene was just a matter of picking the
> >>>>> right address, as the NS bit is used as an address bit on this platform.
> >>>>> This was possible because this machine doesn't have any form of
> >>>>> security. So no HW was changed, no FPGA reprogrammed. Only a firmware
> >>>>> table was fixed to point to the right spot. Not even u-boot or EFI was
> >>>>> changed.
> >>>> Ok, thank you for clarifying.  I have one more question if you don't
> >>>> mind.  I'm aware that dom0 can share physical memory with dom1 via
> >>>> grant tables.
> >>>> However, is it possible to reserve a chunk of contiguous physical
> >>>> memory and directly allocate it only to dom1?
> >>>> For example, if I wanted dom1 to have access to 8MB of contiguous
> >>>> memory at 0x8200_0000 (in addition to whatever virtual memory Xen
> >>>> gives it).
> >>>> How would one go about doing this on ARM?  Is there something in the
> >>>> guest config or device tree that can be set?  Thanks for you help.
> >>> 
> >>> There isn't a "proper" way to do it, only a workaround.
> >>> 
> >>> It is possible to do it by using the iomem option, which is meant for
> >>> device MMIO regions.
> >>> 
> >>> We have patches in the Xilinx Xen tree (not upstream) to allow for
> >>> specifying the cacheability that you want for the iomem mapping so that
> >>> you can map it as normal memory. This is the latest branch:
> >>> 
> >>> https://github.com/Xilinx/xen.git xilinx/release-2020.1
> >>> 
> >>> The relevant commits are the ones from:
> >>> https://github.com/Xilinx/xen/commit/a5c76ac1c5dc14d3e9ccedc5c1e7dd2ddc1397b6
> >>> to:
> >>> https://github.com/Xilinx/xen/commit/b4b7e91c1524f9cf530b81b7ba95df2bf50c78e4
> >>> 
> >>> You might want to make sure that the page is not used by the normal
> >>> memory allocator. This document explains how to something along those
> >>> lines:
> >>> 
> >>> https://github.com/Xilinx/xen/commit/35f72d9130448272e07466bd73cc30406f33135e
> >> 
> >> Thank you.  I appreciate it.
> 

