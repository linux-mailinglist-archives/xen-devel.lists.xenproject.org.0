Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009A51FBDE5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 20:23:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlGFE-0001xD-B2; Tue, 16 Jun 2020 18:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BOBv=75=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1jlGFC-0001x8-R8
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 18:23:34 +0000
X-Inumbo-ID: 7caee554-affe-11ea-b936-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7caee554-affe-11ea-b936-12813bfff9fa;
 Tue, 16 Jun 2020 18:23:34 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22AD32098B;
 Tue, 16 Jun 2020 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592331813;
 bh=L+zcAlpK4LLcoh84ilQFXzQsymWz6X1k9LdpJlw13iY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FJckkZRumHrAUk1+W3+921XrTHy+vkfkgMqXbrIBc4n2nuofB1DvFe/Q2A+Pyg/gs
 cWFSlaFxWUZi1yk48J0R9HbTEkBs8uia5i2D2ijRW589MDaZYvPcvClQB/oTTHJg1b
 GbeBc0leDYXsfuzDSo7vwpbrvSnENC68EJiUX3Pk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jlGF9-003W3p-Ls; Tue, 16 Jun 2020 19:23:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 16 Jun 2020 19:23:31 +0100
From: Marc Zyngier <maz@kernel.org>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
In-Reply-To: <CALYbLDjNF5s2SXkunjJNv4x9jQAcDfoMBWp3WFHBkjnNdfT3Sg@mail.gmail.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
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
 <4bab90465acfddae5868ce2311bd9889@kernel.org>
 <CALYbLDjNF5s2SXkunjJNv4x9jQAcDfoMBWp3WFHBkjnNdfT3Sg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <bd3fade765bf21342a4ce6b952a5ca00@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: codewiz2280@gmail.com, julien.grall.oss@gmail.com,
 Bertrand.Marquis@arm.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, nd@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-16 19:13, CodeWiz2280 wrote:
> On Tue, Jun 16, 2020 at 4:11 AM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2020-06-15 20:14, CodeWiz2280 wrote:
>> 
>> [...]
>> 
>> > Also, the latest linux kernel still has the X-Gene storm distributor
>> > address as "0x78010000" in the device tree, which is what the Xen code
>> > considers a match with the old firmware.  What were the addresses for
>> > the device tree supposed to be changed to?
>> 
>> We usually don't care, as the GIC address is provided by the 
>> bootloader,
>> whether via DT or ACPI (this is certainly what happens on Mustang).
>> Whatever is still in the kernel tree is just as dead as the platform 
>> it
>> describes.
>> 
>> > Is my understanding
>> > correct that there is a different base address required to access the
>> > "non-secure" region instead of the "secure" 0x78010000 region?  I'm
>> > trying to see if there are corresponding different addresses for the
>> > keystone K2E, but haven't found them yet in the manuals.
>> 
>> There is no such address. Think of the NS bit as an *address space*
>> identifier.
>> 
>> The only reason XGene presents the NS part of the GIC at a different
>> address is because XGene is broken enough not to have EL3, hence no
>> secure mode. To wire the GIC (and other standard ARM IPs) to the core,
>> the designers simply used the CPU NS signal as an address bit.
>> 
>> On your platform, the NS bit does exist. I strongly suppose that it
>> isn't wired to the GIC. Please talk to your SoC vendor for whether iot
>> is possible to work around this.
>> 
> I do have a question about this out to TI, but at least this method
> gives me something to work with in the meantime.  I was just looking
> to confirm that there wouldn't be any other undesirable side effects
> with Dom0 or DomU when using it.  Was there an actual FPGA for the
> X-Gene that needed to be updated which controlled the GIC access?  Or
> by firmware do you mean the boot loader (e.g. uboot).  Thanks for the
> support so far to all.

As I said, the specific case of XGene was just a matter of picking the 
right address, as the NS bit is used as an address bit on this platform. 
This was possible because this machine doesn't have any form of 
security. So no HW was changed, no FPGA reprogrammed. Only a firmware 
table was fixed to point to the right spot. Not even u-boot or EFI was 
changed.

         M.
-- 
Jazz is not dead. It just smells funny...

