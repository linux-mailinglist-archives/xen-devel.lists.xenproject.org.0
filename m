Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E9D1FA2D7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 23:34:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkwig-0006UQ-1A; Mon, 15 Jun 2020 21:32:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CMz=74=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jkwie-0006UJ-HP
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 21:32:40 +0000
X-Inumbo-ID: bcd0b310-af4f-11ea-bca7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcd0b310-af4f-11ea-bca7-bc764e2007e4;
 Mon, 15 Jun 2020 21:32:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABDAD20707;
 Mon, 15 Jun 2020 21:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592256759;
 bh=3peKaglNXSF71RHEwcxQB7QP4tsh16uS7MBiWTN7rpg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pQDxLtj3AoT9jboufTX67dYFrwDykHBll54Ktts67hqK4QaE6HPHrza5FH8Nrh94P
 I9KwDaLETmRkni6jzpsf8oOzQf6iBUWoycdBPwoRioK5ou/MhbMQUOmACd469NJe2C
 6yhJ2Fq3b8h78Jqy/ZYs+DpZFihD02upG4RnlqMs=
Date: Mon, 15 Jun 2020 14:32:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
In-Reply-To: <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006151426160.9074@sstabellini-ThinkPad-T480s>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <CAJ=z9a1k606A+sA467eY8iPuHnptMUFzxEFithpe=JKHogjt0g@mail.gmail.com>
 <CALYbLDjF8_eoNB_pSfbD73LkC3Ppyxpi0MxHgtS5y_wc-TVfzQ@mail.gmail.com>
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
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 15 Jun 2020, CodeWiz2280 wrote:
> On Wed, Jun 10, 2020 at 5:46 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
> >
> > Hi Marc,
> >
> > On Tue, 9 Jun 2020 at 18:45, Marc Zyngier <maz@kernel.org> wrote:
> > > > I was wondering if you heard about any potential issue with guest EOI
> > > > not forwarded to the host. This is on TI Keystone (Cortex A-15).
> > >
> > > Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway
> > > all run just fine with guest EOI), and GIC-400 is a pretty solid piece
> > > of kit (it is just sloooooow...).
> > >
> > > Thinking of it, you would see something like that if the GIC was seeing
> > > the writes coming from the guest as secure instead of NS (cue the early
> > > firmware on XGene that exposed the wrong side of GIC-400).
> >
> > Ah, I remember that one.  We used to carry an hack in Xen [1] for
> > X-Gene. Thankfully they fixed the firmware!
> >
> > If it is a similar issue, then the firmware path would definitely be
> > my preference.
> >
> > Thank you for the input!
> 
> Thank you all for the information.  If I pull the changes to use the
> maintenance interrupt for the X-Gene back into the latest build of Xen
> then my issue with the Edge and Level interrupts is resolved.  My
> ethernet and other devices work fine again for the Keystone in dom0.
> Are there any concerns over operating this way, meaning with the
> maintenance interrupt workaround rather than the EOI?  Is this safe?

It should be fine, a small impact on performance, that's all.


> Also, the latest linux kernel still has the X-Gene storm distributor
> address as "0x78010000" in the device tree, which is what the Xen code
> considers a match with the old firmware.  What were the addresses for
> the device tree supposed to be changed to?  Is my understanding
> correct that there is a different base address required to access the
> "non-secure" region instead of the "secure" 0x78010000 region?  I'm
> trying to see if there are corresponding different addresses for the
> keystone K2E, but haven't found them yet in the manuals.

I went through the old emails archive but couldn't find a mention of the
other address, sorry.

