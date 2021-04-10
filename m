Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9735A982
	for <lists+xen-devel@lfdr.de>; Sat, 10 Apr 2021 02:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108012.206389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lV1Tj-0007l3-Lz; Sat, 10 Apr 2021 00:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108012.206389; Sat, 10 Apr 2021 00:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lV1Tj-0007ke-Ij; Sat, 10 Apr 2021 00:27:59 +0000
Received: by outflank-mailman (input) for mailman id 108012;
 Sat, 10 Apr 2021 00:27:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSxs=JH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lV1Ti-0007kZ-MC
 for xen-devel@lists.xenproject.org; Sat, 10 Apr 2021 00:27:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59c4f9ca-6b6a-4a20-bcb3-8211dbdc0170;
 Sat, 10 Apr 2021 00:27:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CE1B600D4;
 Sat, 10 Apr 2021 00:27:57 +0000 (UTC)
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
X-Inumbo-ID: 59c4f9ca-6b6a-4a20-bcb3-8211dbdc0170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618014477;
	bh=mksoIbwS4pfQYKXzWjcVtcZIWgi8Idw19YRPLIwImNM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ijbGXm3hfyZYHHpg7MUZuCfOfYNfvzsoEkXyD+LV0VOxfb0x/wUJ0iVvrNP6Dk3Tj
	 dr09uiETYmPeTY5jqZyFw0aiDTl30B0LXzcfoZDHGEq2a/jTgleG/EMwoD4zKT88Oz
	 eL7sfIHBPgnNiYOKIFFNl1anbqXJQPAy8DzGqwSRAUptPPxXpSCWtN2gAZp0lh5aVu
	 7CdhVZDrYZOdMR175rNv6xXFcVB7Bn4JS833bcqtPpEG8uH0xpkwZimdhfmslD1kAg
	 ErxFjl7bdKZUe4GfBnbYUEv8rWomQylXsJaMpHe6x3lZy1ySW3cHNwEufMqfrVwibw
	 zlo8yOhOBN1jQ==
Date: Fri, 9 Apr 2021 17:27:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, 
    brian.woods@xilinx.com
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
In-Reply-To: <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2104091714270.4885@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s> <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org> <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Apr 2021, Stefano Stabellini wrote:
> On Mon, 5 Apr 2021, Julien Grall wrote:
> > On 26/01/2021 22:58, Stefano Stabellini wrote:
> > > Hi all,
> > 
> > Hi Stefano,
> > 
> > > This series introduces support for the generic SMMU bindings to
> > > xen/drivers/passthrough/arm/smmu.c.
> > > 
> > > The last version of the series was
> > > https://marc.info/?l=xen-devel&m=159539053406643
> > Some changes in the SMMU drivers went in recently. I believe this touched
> > similar area to this series. Would you be able to check that this series still
> > work as intented?
> 
> Thanks for the heads up, no, unfortunately they don't work :-(
> 
> They badly clash. I did the forward port of the three patches but they
> fail at runtime in my tests. I ran out of time to figure out what is the
> problem, and I'll have to pick it up at some point in the future (it
> might not be any time soon unfortunately).
> 
> Rahul, if you have any ideas about what the problem is please let me
> know. This is the branch with the forward port:
> 
> http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git smmu-generic

I did some more investigation and spotted a minor error in my forward
port. This an updated branch based on staging:

http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git smmu-generic-2

However, the real issue is that Rahul's patches break SMMU support on
ZynqMP even without my changes. I ran a bisection and found out that
patch #2 is the culprit:

5ee3fa0b21ea xen/arm: smmuv1: Consolidate stream map entry state

It causes the abort appended below. The problem doesn't seem
particularly ZynqMP specific. Rahul, can you reproduce it on your side?



(XEN) smmu: /amba/smmu@fd800000: d0: p2maddr 0x000000087bfa2000
(XEN) Data Abort Trap. Syndrome=0x5
(XEN) Walking Hypervisor VA 0x114ebfff8 on CPU0 via TTBR 0x0000000000f38000
(XEN) 0TH[0x0] = 0x0000000000f3bf7f
(XEN) 1ST[0x4] = 0x0000000000000000
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.14.0  arm64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     000000000024a77c smmu.c#find_smmu_master+0x8/0x3c
(XEN) LR:     000000000024a8a4
(XEN) SP:     00000000002ff1f0
(XEN) CPSR:   80000249 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000114ec0000  X1: 00008000fbfc7478  X2: 00008000fbfc71e0
(XEN)      X3: 00000000002af840  X4: 0000000000000000  X5: 0000000000000001
(XEN)      X6: 0000000000000000  X7: 0000000000000000  X8: 00008000fbf8b9e0
(XEN)      X9: 0000000000000004 X10: 0101010101010101 X11: 0000000000000020
(XEN)     X12: 0000000000000018 X13: ff00000000000000 X14: 0400000084000000
(XEN)     X15: 0000000000000000 X16: 00000000002b1000 X17: 00000000002b1000
(XEN)     X18: 00000000002b2000 X19: 00008000fbffcb70 X20: 00000000002af848
(XEN)     X21: 00008000fbfc7478 X22: 00008000fbfc74d8 X23: 00008000fbfc7508
(XEN)     X24: 0000000000000000 X25: 0000000000000001 X26: 00008000fbfa7c20
(XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 00000000002ff1f0
(XEN) 
(XEN)   VTCR_EL2: 80023558
(XEN)  VTTBR_EL2: 000000087bf54000
(XEN) 
(XEN)  SCTLR_EL2: 30cd183d
(XEN)    HCR_EL2: 000000000000003a
(XEN)  TTBR0_EL2: 0000000000f38000
(XEN) 
(XEN)    ESR_EL2: 96000005
(XEN)  HPFAR_EL2: 0000000000220000
(XEN)    FAR_EL2: 0000000114ebfff8
(XEN) 
(XEN) Xen stack trace from sp=00000000002ff1f0:
(XEN)    00000000002ff220 000000000024ae80 00008000fbfa5000 00008000fbfc74e8
(XEN)    00008000fbfa5000 0000000800000001 00000000002ff2a0 000000000024c6e8
(XEN)    00008000fbfa5000 00000000fffffff0 00008000fbfc7478 00008000fbfc74d8
(XEN)    00008000fbfc7508 0000000000000000 0000000000000001 0000000000000001
(XEN)    0000000000000000 0000000000000000 00000000002ff2a0 000000000024c6b8
(XEN)    00008000fbfa5000 00000000002ff550 00000000002ff2d0 00000000002c6274
(XEN)    00008000fbfc7478 00000000002ff550 00008000fbfa5000 0000000000000005
(XEN)    00000000002ff390 00000000002c6704 00008000fbfc3ce8 00000000002ff550
(XEN)    00008000fbfa5000 0000000000000005 00008000fbfc7478 0000000000000000
(XEN)    00008000fbff1100 0000000000000000 0000000000000000 0000000000000000
(XEN)    00000000002d28e8 00000000fbf78090 00000000002d28d8 00000000002d1b80
(XEN)    00000000002ff380 00000000ff0b0000 00008000fbfc3ce8 0000000000001000
(XEN)    00008000fbfa5000 00008000fbfa5000 0000000000000005 00000000002c6600
(XEN)    00000000002ff450 00000000002c6704 00008000fbfc0000 00000000002ff550
(XEN)    00008000fbfa5000 0000000000000005 00008000fbfc3ce8 0000000000000000
(XEN)    00008000fbff00a8 0000000000000013 0000000000000000 0000000000000000
(XEN)    00000000002d28e8 00000000fbf78090 00000000002d28d8 00000000002d1b80
(XEN)    00000000002ff440 00000000ff990000 00008000fbfc0000 0000000000001000
(XEN)    00008000fbfa5000 00008000fbfa5000 0000000000000005 00000000002c6600
(XEN)    00000000002ff510 00000000002c6f78 0000000000008090 0000000000e00000
(XEN)    00000000002d2ae8 00008000fbfa5000 000000000000000f 0000000000000004
(XEN)    00000000002e05e0 0000000000000000 0000000880000000 0000000000000002
(XEN)    00000000002d28e8 000000000022d1e4 00000000002d28d8 00000000002d1b80
(XEN)    00000000002ff500 00000000002b7da0 0000000000008090 0000000000e00000
(XEN)    00000000002d2ae8 00008000fbfa5000 0000000000000005 00000000002c6f60
(XEN)    00000000002ffdf0 00000000002cb1fc 00008000fbfa5000 00000000002b0600
(XEN)    0000000000340430 0000000000000004 00000000002a3810 0000000000000000
(XEN)    0000000000000001 00008000fbfa5000 00008000fbf70000 0000000000000000
(XEN)    0000000000000001 0000000020000000 0000000040000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<000000000024a77c>] smmu.c#find_smmu_master+0x8/0x3c (PC)
(XEN)    [<000000000024a8a4>] smmu.c#find_smmu_for_device+0x48/0x94 (LR)
(XEN)    [<000000000024ae80>] smmu.c#arm_smmu_assign_dev+0x58/0xb48
(XEN)    [<000000000024c6e8>] iommu_assign_dt_device+0x64/0xc0
(XEN)    [<00000000002c6274>] domain_build.c#handle_node+0x310/0x9ec
(XEN)    [<00000000002c6704>] domain_build.c#handle_node+0x7a0/0x9ec
(XEN)    [<00000000002c6704>] domain_build.c#handle_node+0x7a0/0x9ec
(XEN)    [<00000000002c6f78>] construct_dom0+0x410/0x4bc
(XEN)    [<00000000002cb1fc>] start_xen+0xb9c/0xca4
(XEN)    [<00000000002001a0>] arm64/head.o#primary_switched+0xc/0x1c

