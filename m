Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6412DA5D6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 02:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52795.92127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kozWI-0002lY-Al; Tue, 15 Dec 2020 01:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52795.92127; Tue, 15 Dec 2020 01:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kozWI-0002l9-6y; Tue, 15 Dec 2020 01:52:54 +0000
Received: by outflank-mailman (input) for mailman id 52795;
 Tue, 15 Dec 2020 01:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0G7T=FT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kozWG-0002l4-JB
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 01:52:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d17f2660-9a22-4df9-982a-656cc2eea155;
 Tue, 15 Dec 2020 01:52:51 +0000 (UTC)
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
X-Inumbo-ID: d17f2660-9a22-4df9-982a-656cc2eea155
Date: Mon, 14 Dec 2020 17:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607997170;
	bh=ViCdukLfbIAXEKuyIdxNNST56FI+jT/9Fj7edXZyNco=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=iRcSeeWm/8SKr3BqBxA4U1mzN+7jkn0zvgak2NxvIcWQ06AmapyiUsEZJ8CQSh9mT
	 W/D4gVi04ICXs8EsW0z5RCKNkT8ctwJrPW9Yvo8Sr0XIxXYiYLJ1tM4rUQHuUP0eEe
	 Owcc19VElxSyg6ms+H8cSZ45tzogs8ni0BhSWSjbkRaPHc1iF2kFnhFSqSRIp9FXZh
	 vzrlMWvlT9anbvdkH5UAtYNhYm61OVyhIZ8H4W2hYhWcwj0Mz9o4AHCmadgLT9u7Ti
	 ELJCYpMAG4zRXOmFebEAZCJO/KaAi+igJAhzyHtP+MFjEd5k/LiswYhtF9/FLCbAPX
	 npKhrQ1QLsFuw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 0/8] xen/arm: Add support for SMMUv3 driver
In-Reply-To: <8ED5EAAF-48B0-4289-BCB0-232F70001134@arm.com>
Message-ID: <alpine.DEB.2.21.2012141752330.4040@sstabellini-ThinkPad-T480s>
References: <cover.1607617848.git.rahul.singh@arm.com> <ea121c23-4deb-c566-4d1d-bb9dd4959015@xen.org> <8ED5EAAF-48B0-4289-BCB0-232F70001134@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1339817675-1607997170=:4040"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1339817675-1607997170=:4040
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 14 Dec 2020, Rahul Singh wrote:
> Hello Julien,Stefano
> 
> > On 11 Dec 2020, at 2:29 pm, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Rahul,
> > 
> > On 10/12/2020 16:56, Rahul Singh wrote:
> >> This patch series is v3 of the work to add support for the SMMUv3 driver.
> >> Approach taken is to first merge the Linux copy of the SMMUv3 driver
> >> (tag v5.8.18) and then modify the driver to build on XEN.
> >> MSI and PCI ATS functionality are not supported. Code is not tested and
> >> compiled. Code is guarded by the flag CONFIG_PCI_ATS and CONFIG_MSI to compile
> >> the driver.
> >> Code specific to Linux is removed from the driver to avoid dead code.
> >> Driver is currently supported as tech preview.
> >> Following functionality should be supported before driver is out for tech
> >> preview
> >> 1. Investigate the timing analysis of using spin lock in place of mutex when
> >>    attaching a  device to SMMU.
> >> 2. Merged the latest Linux SMMUv3 driver code once atomic operation is
> >>    available in XEN.
> >> 3. PCI ATS and MSI interrupts should be supported.
> >> 4. Investigate side-effect of using tasklet in place of threaded IRQ and fix
> >>    if any.
> > In your last e-mail, you wrote that you would investigate and then come back to use. It wasn't clear that this meant you will not deal with it in this series.
> > 
> 
> Yes, I will investigate the side-effect of using tasklet but not part of this patch series. It will be great if we proceed on this patch series as it is (using tasklet in place of threaded-IRQ).
> 
> >> 5. fallthorugh keyword should be supported.
> > 
> > This one should really be done now... It is not a complicated one...
> 
> Ok. I will implement in next version.
>  
> > 
> >> 6. Implement the ffsll function in bitops.h file.
> 
> While implementing the code I found out that Linux is using the built-in function “__builtin_ffsll() “ for ffsll and there is no implementation available in Linux for ffsll.
> If we implement the ffsll in XEN we will diverge from Linux. I am thinking of adding the below code in "xen/include/asm-arm/bitops.h”. 
> Please suggest if it is okay?
> 
> static always_inline int ffsll(long long x)                                           
> {                                                                               
>     return __builtin_ffsll(x);                                                    
> }

I think that's OK if it builds with clang too.
--8323329-1339817675-1607997170=:4040--

