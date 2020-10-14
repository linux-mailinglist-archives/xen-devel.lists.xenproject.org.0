Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA75E28D7CA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 03:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6422.17114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSVFQ-00027p-69; Wed, 14 Oct 2020 01:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6422.17114; Wed, 14 Oct 2020 01:06:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSVFQ-00027K-1u; Wed, 14 Oct 2020 01:06:32 +0000
Received: by outflank-mailman (input) for mailman id 6422;
 Wed, 14 Oct 2020 01:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kSVFN-00027F-Vd
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 01:06:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb69429e-fdaa-497c-9685-157bef0fd2eb;
 Wed, 14 Oct 2020 01:06:28 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13736208B3;
 Wed, 14 Oct 2020 01:06:27 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zgx5=DV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kSVFN-00027F-Vd
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 01:06:30 +0000
X-Inumbo-ID: eb69429e-fdaa-497c-9685-157bef0fd2eb
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id eb69429e-fdaa-497c-9685-157bef0fd2eb;
	Wed, 14 Oct 2020 01:06:28 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 13736208B3;
	Wed, 14 Oct 2020 01:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602637587;
	bh=oJhlGVtF1Tk5FO3i6heiukaqcfG80pU4yQtavGGC3OU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hChKhc0Ds+AoHI3nIdnZUO+zSc8AvIY2mkuqkK6RlOdHUOQ3ELufx1d9mvESXB7qu
	 kG8Qqr3GuvKkhnAIVMNWOHTASlABpInTPLvuhK8dFHgWwdbFj/5ukbdnIpjWC5NvnO
	 1Xr2A+BSjS9vqjB0qmzCiWS2eWptnmW8TX141mWA=
Date: Tue, 13 Oct 2020 18:06:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>, 
    bertrand.marquis@arm.com, andre.przywara@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
In-Reply-To: <20201012213451.GA89158@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2010131759270.10386@sstabellini-ThinkPad-T480s>
References: <20200926205542.9261-1-julien@xen.org> <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com> <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org> <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s>
 <20201012213451.GA89158@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2020, Elliott Mitchell wrote:
> On Mon, Oct 12, 2020 at 12:02:14PM -0700, Stefano Stabellini wrote:
> > On Sat, 10 Oct 2020, Julien Grall wrote:
> > > Therefore, I think the code should not try to find the STAO. Instead, it
> > > should check whether the SPCR table is present.
> > 
> > Yes, that makes sense, but that brings me to the next question.
> > 
> > SPCR seems to be required by SBBR, however, Masami wrote that he could
> > boot on a system without SPCR, which gets me very confused for two
> > reasons:
> > 
> > 1) Why there is no SPCR? Isn't it supposed to be mandatory? Is it
> > because there no UART on Masami's system?
> 
> I'm on different hardware, but some folks have setup Tianocore for it.
> According to Documentation/arm64/acpi_object_usage.rst,
> "Required: DSDT, FADT, GTDT, MADT, MCFG, RSDP, SPCR, XSDT".  Yet when
> booting a Linux kernel directly on the hardware it lists APIC, BGRT,
> CSRT, DSDT, DBG2, FACP, GTDT, PPTT, RSDP, and XSDT.
> 
> I don't know whether Linux's ACPI code omits mention of some required
> tables and merely panics if they're absent.  Yet I'm speculating the list
> of required tables has shrunk, SPCR is no longer required, and the
> documentation is out of date.  Perhaps SPCR was required in early Linux
> ACPI implementations, but more recent ones removed that requirement?

I have just checked and SPCR is still a mandatory table in the latest
SBBR specification. It is probably one of those cases where the firmware
claims to be SBBR compliant, but it is not, and it happens to work with
Linux.

