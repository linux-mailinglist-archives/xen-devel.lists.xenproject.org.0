Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F73D5B9FEF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 18:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407613.650173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYs33-0002iP-Rn; Thu, 15 Sep 2022 16:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407613.650173; Thu, 15 Sep 2022 16:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYs33-0002fT-OQ; Thu, 15 Sep 2022 16:49:09 +0000
Received: by outflank-mailman (input) for mailman id 407613;
 Thu, 15 Sep 2022 16:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaaQ=ZS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oYs32-0002fN-5T
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 16:49:08 +0000
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f11bf32-3516-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 18:49:06 +0200 (CEST)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 06CFB18000B2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 12:49:04 -0400 (EDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by mta-05.privateemail.com (Postfix) with ESMTPA id D709618000AD
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 12:49:03 -0400 (EDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-3454e58fe53so227988267b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 09:49:03 -0700 (PDT)
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
X-Inumbo-ID: 4f11bf32-3516-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1663260543;
	bh=JZ8C7J0KQgGgRo+qCni2mXYj7kmGaMJzfb38RhyPcTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cl5qam9j7y8hcpX708VyNSDwkXTVu1jIHDITi4r6sqPKAUKPyR2y81F+WI0/Sv08t
	 4LJyrWS7VLVIN+Ekiw4gd2LAijEMxrJFnsWMPqn26BtaWTbSCGUsgHQP96m4ef9mdM
	 wDXzh1aFxHpRdJ+u3tTHQBfwDW5Y6PxVepdEiVCtCdsA7RzJnUWz5Dz+d3BugkCovV
	 BbmNH4GnSNFfWco73j3AIjBtLJg4ofeotW1ZPbOoj5dhU7DsTZ0Hd2YsWqx0sNx8Zz
	 vf7Lhd61Y6u3EgqWm/aVIxXSRwJwy1xs7YX/XqsqWFkirnmw6Krz3FK9gLgPuN5Akh
	 snesGSZiiANaw==
X-Gm-Message-State: ACrzQf25peBWvYhFw35gIizjFd2ABNqKGpVERDhUkIfTaRi3iljb5OaZ
	mhM0iT4SYQuMOqpu83BRZ6gXa01hghZuo2rGrsc=
X-Google-Smtp-Source: AMsMyM4vlxa3J562aEzDTpW2//G6KlsNL8G+cjicemdVo5GiHN8yyz1qHBecMXS103yw+CyO8xMjgouXQGovY/8+ZYA=
X-Received: by 2002:a81:6143:0:b0:335:3076:168e with SMTP id
 v64-20020a816143000000b003353076168emr610450ywb.460.1663260542974; Thu, 15
 Sep 2022 09:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl> <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com> <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com> <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
In-Reply-To: <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 15 Sep 2022 12:48:27 -0400
X-Gmail-Original-Message-ID: <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
Message-ID: <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
Subject: Re: Console output stops on dbgp=xhci
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Sep 15, 2022 at 10:39 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.09.2022 16:16, Tamas K Lengyel wrote:
> > On Thu, Sep 15, 2022 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 15.09.2022 16:05, Tamas K Lengyel wrote:
> >>> On Thu, Sep 15, 2022 at 3:56 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>>>
> >>>> On 15.09.2022 02:41, Tamas K Lengyel wrote:
> >>>>>>> Do you have any idea what might be going on and preventing the output
> >>>>>>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
> >>>>>>> present on the receiving side, just nothing is being received over it.
> >>>>>>
> >>>>>> There are few more patches in the series that are de facto required.
> >>>>>> Especially those about IOMMU, otherwise it can only possibly work with
> >>>>>> iommu=0 (which I'm not sure if even is enough).
> >>>>>
> >>>>> Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
> >>>>> on the console:
> >>>>>
> >>>>> (XEN) Panic on CPU 0:
> >>>>> (XEN) FATAL PAGE FAULT
> >>>>> (XEN) [error_code=0011]
> >>>>> (XEN) Faulting linear address: 00000000328b3a54
> >>>>
> >>>> Perhaps in another thread, could you post details about this? I guess
> >>>> we want to address this independent of your XHCI issue. That's an
> >>>> attempt to execute code outside of the Xen image - the only reason I
> >>>> can think of for this would be an EFI boot services or runtime
> >>>> services call, with (possibly but not necessarily) quirky EFI firmware.
> >>>> Any other context this is appearing in would quite certainly require a
> >>>> fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
> >>>> calls we make.
> >>>
> >>> This was indeed observed with a xen.efi booted directly from UEFI.
> >>> Beside the limited boot log I get through xhci I don't have more
> >>> insight but happy to send that (and anything else you think would be
> >>> useful).
> >>
> >> And with "iommu=0" but no use of XHCI it doesn't crash? Or there you have
> >> no way to collect the log then?
> >>
> >> In any event, from your description the interesting part might be the
> >> EFI memory map. That ought to be pretty stable between boots, so you may
> >> be able to collect that in full via "xl dmesg" in a run without "iommu=0".
> >
> > I see the same crash with no xhci debug use. The EFI map is:
> >
> > (XEN) EFI memory map:
> >[...]
> > (XEN)  0000031f72000-0000032a95fff type=3 attr=000000000000000f
>
> This is the entry covering the address, which is EfiBootServicesCode
> with no unusual attributes. Assuming the crash was still during boot
> (of Xen, not Dom0), do you also have at least the full stack walk
> from the crash, to know where in Xen the call chain started?

I don't see a stack walk right now, but it looks like the path to it
is a previous panic that wants to restart the machine:

(XEN) Panic on CPU 0:

(XEN) Couldn't enable IOMMU and iommu=required/force

(XEN) ****************************************

(XEN)

(XEN) Reboot in five seconds...

(XEN) ----[ Xen-4.17-unstable  x86_64  debug=y  Not tainted ]----

(XEN) CPU:    0

(XEN) RIP:    e008:[<00000000328b3a54>] 00000000328b3a54

(XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor

(XEN) rax: 0000000035efe498   rbx: 0000000035efe4d0   rcx: 0000000000000001

(XEN) rdx: 000000000311100a   rsi: 0000000000000000   rdi: 0000000000000001

(XEN) rbp: 0000000000000001   rsp: ffff82d040657b18   r8:  0000000000000000

(XEN) r9:  0000000035fc2080   r10: 0000000000000001   r11: 0c00000000000000

(XEN) r12: 0000000000000000   r13: 000000000311100a   r14: 000000000000001f

(XEN) r15: 0000000035fc2080   cr0: 0000000080050033   cr4: 00000000007506e0

(XEN) cr3: 00000008a12ae000   cr2: 00000000328b3a54

(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000

(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008

(XEN) Xen code around <00000000328b3a54> (00000000328b3a54):

(XEN)  49 8b e3 5d c3 cc cc cc <33> c0 c3 cc 40 53 48 83 ec 20 44 8b d1 44 8b da

(XEN) Xen stack trace from rsp=ffff82d040657b18:

(XEN)    0000000035ff6737 ffff82d040657b60 0000000000000046 ffff82d040657b40

(XEN)    ffff82d04024f48f 0000000000000000 ffff82d04024f50a 0000000000000000

(XEN)    ffff82d040968d40 0000000000000000 0000000035fc2080 ffff82d04041a848

(XEN)    ffff82d040930400 0000000000000001 0000000035ff67c9 0000000000000001

(XEN)    000000000311100a 0000000000000000 0000000000000000 0000000000000000

(XEN)    ffff82d040922980 0000000000000000 0000000000000000 ffff82d04041a848

(XEN)    0000000035fc18e4 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000035fc15b0 0000000000000000 ffff82d040657fff 0000000000000000

(XEN)    00000000007506e0 000000000000000f 0000000000000000 ffff82d040930400

(XEN)    0000000035fba737 0000000000000000 0000000000000000 0000000000000000

(XEN)    0000000000000000 ffff82d040657cb0 ffff82d04028332c 0000000000000065

(XEN)    ffff82d0402835d6 0000000000000000 ffff82d040657ce8 0000000000000000

(XEN)    00000008a12ae000 0000000028e16000 0000000000000000 000000000000e008

(XEN)    0000000000000287 0000000000000000 ffff82d040657d38 ffff82d04032dbee

(XEN)    0000138840657d48 000082d040657d08 0000000000000000 0000000000000296

(XEN)    ffff82d040930400 00000000ffffffff ffff82d04080b400 000000000000000f

(XEN)    ffff82d040657da0 ffff82d04024d682 0c00000000000010 ffff82d040657db0

(XEN)    ffff82d040657d60 0000000000000000 ffff82d04043f16c 0000000000000001

(XEN)    0000000000171240 0000000000000000 7fffffffffffffff 00000000ffffffed

(XEN) Xen call trace:

(XEN)    [<00000000328b3a54>] R 00000000328b3a54

(XEN)    [<0000000035ff6737>] S 0000000035ff6737

(XEN)

(XEN) Pagetable walk from 00000000328b3a54:

(XEN)  L4[0x000] = 00000008a12ad063 ffffffffffffffff

(XEN)  L3[0x000] = 0000000028e0e063 ffffffffffffffff

(XEN)  L2[0x194] = 80000000328001e3 ffffffffffffffff (PSE)

(XEN)

(XEN) ****************************************

(XEN) Panic on CPU 0:

(XEN) FATAL PAGE FAULT

(XEN) [error_code=0011]

(XEN) Faulting linear address: 00000000328b3a54

(XEN) ****************************************

(XEN)

(XEN) Reboot in five seconds...

(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

