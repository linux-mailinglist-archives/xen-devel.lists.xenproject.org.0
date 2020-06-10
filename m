Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0781F5533
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 14:53:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj0EM-0005hL-44; Wed, 10 Jun 2020 12:53:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ieVI=7X=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1jj0EK-0005hF-B1
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 12:53:20 +0000
X-Inumbo-ID: 5b01c907-ab19-11ea-b42d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b01c907-ab19-11ea-b42d-12813bfff9fa;
 Wed, 10 Jun 2020 12:53:18 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E4A720734;
 Wed, 10 Jun 2020 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591793597;
 bh=fhb/IE+L+6oFamjPqDHVhaK35ERv6i0wGNU4Jy9uwFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zMnTDiyVaZJX4RuGFKnokSZmemtzflLkxH8CTOZN2A19y+hR4IpivNMIh5mqm0Opl
 DtjyhkFiASBibYqh4Pp7oky8yxjcJWQWxmFlmBMvinCkxVBLktcsoYN75eFAeqn9zk
 aSKe+D96bmnfldl06TgmpvMjA6gDfusNOktXwSwQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jj0EF-001n7x-Rw; Wed, 10 Jun 2020 13:53:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Jun 2020 13:53:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
In-Reply-To: <CALYbLDiYPmcetVh3XDf=qgo+gLHAM-VhU4xKP2jKd51H3RKgVA@mail.gmail.com>
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
 <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
 <d16faf89f25a6183bc6cbdc6148af4b4@kernel.org>
 <5C2DB5F7-832E-4B02-A99A-8B5C7CEC7645@arm.com>
 <CALYbLDiYPmcetVh3XDf=qgo+gLHAM-VhU4xKP2jKd51H3RKgVA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <c654a87f81d0f5b17c865c59ff53bd94@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: codewiz2280@gmail.com, Bertrand.Marquis@arm.com,
 julien@xen.org, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 nd@arm.com
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-10 13:39, CodeWiz2280 wrote:

[...]

> The problem is that a hack may be my only solution to getting this
> working on this platform.  If TI says that they don't support it then
> i'm stuck.  Just to summarize the problem, we believe that the GIC is
> seeing secure accesses from dom0 when they should be non-secure.  This

Not necessarily just dom0. The hypothesis is that accesses to the GICV
and/or GICD regions from a non-secure guest are treated as secure.
My hunch is that it is only GICV that gets messed with, as you seem
to solve it by writing to GICC.

> is causing the VGIC ack to be non-functional from dom0.   We would
> need a firmware that supports both secure and non-secure accesses.

Not exactly. You'd need the bridge between the CPU and the GIC to honor
NS bit passed on the bus (AXI or otherwise). That is assuming that:
- the NS attribute is actually present on the interconnect
- the HW is configurable
- our "finger in the air" analysis is actually correct

As for the last point, only someone with access to the RTL could
tell you...

> The Xen code gets to "gicv2_guest_irq_end()" where it executes
> "gicv2_eoi_irq()", but then we had to add the deactivate
> "gicv2_dir_irq" to clear the virtual interrupt manually to get things
> going again.

Also known as "priority drop" and "deactivation". You may want to
use architectural terms when explaining this to HW people.

         M.
-- 
Jazz is not dead. It just smells funny...

