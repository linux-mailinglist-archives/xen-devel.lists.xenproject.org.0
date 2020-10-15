Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1633E28F80A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 20:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7710.20305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT7Y3-0007DY-5k; Thu, 15 Oct 2020 18:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7710.20305; Thu, 15 Oct 2020 18:00:19 +0000
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
	id 1kT7Y3-0007D9-2F; Thu, 15 Oct 2020 18:00:19 +0000
Received: by outflank-mailman (input) for mailman id 7710;
 Thu, 15 Oct 2020 18:00:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LXD=DW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kT7Y1-0007D4-LM
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 18:00:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be0109e6-9f76-472e-a777-c045964be67d;
 Thu, 15 Oct 2020 18:00:17 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 823E122263;
 Thu, 15 Oct 2020 18:00:15 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+LXD=DW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kT7Y1-0007D4-LM
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 18:00:17 +0000
X-Inumbo-ID: be0109e6-9f76-472e-a777-c045964be67d
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id be0109e6-9f76-472e-a777-c045964be67d;
	Thu, 15 Oct 2020 18:00:17 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 823E122263;
	Thu, 15 Oct 2020 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602784816;
	bh=EISWL5wvNeHXVXUA8VqngZry+deFyoOswKvzNvnlW5I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JylAledAIJeKKsQnjEAQl9hZM736l3atMXsMUUVeRrwzxuOLlAuIWgZHlXrBn+OLg
	 jJgKm9QWiohKjfMKIihf0x6tACO7jgh6ZzfK366K0l6TJroljce+exeHu8bEGIbT1U
	 TtHL2Wzx/n7Q9b/sE3CwHJwcX71Es34HiVbpFNRc=
Date: Thu, 15 Oct 2020 11:00:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Elliott Mitchell <ehem+xen@m5p.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>, 
    bertrand.marquis@arm.com, andre.przywara@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
In-Reply-To: <1b5f19f6-ea70-9e58-bf36-de7f7d54153a@xen.org>
Message-ID: <alpine.DEB.2.21.2010151058370.10386@sstabellini-ThinkPad-T480s>
References: <20200926205542.9261-1-julien@xen.org> <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com> <1a7b5a14-7d21-b067-a80b-27d963f9798a@xen.org> <alpine.DEB.2.21.2010121157350.10386@sstabellini-ThinkPad-T480s> <20201012213451.GA89158@mattapan.m5p.com>
 <alpine.DEB.2.21.2010131759270.10386@sstabellini-ThinkPad-T480s> <20201014013706.GA98635@mattapan.m5p.com> <1b5f19f6-ea70-9e58-bf36-de7f7d54153a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Oct 2020, Julien Grall wrote:
> Hi Elliot,
> 
> On 14/10/2020 02:37, Elliott Mitchell wrote:
> > On Tue, Oct 13, 2020 at 06:06:26PM -0700, Stefano Stabellini wrote:
> > > On Mon, 12 Oct 2020, Elliott Mitchell wrote:
> > > > I'm on different hardware, but some folks have setup Tianocore for it.
> > > > According to Documentation/arm64/acpi_object_usage.rst,
> > > > "Required: DSDT, FADT, GTDT, MADT, MCFG, RSDP, SPCR, XSDT".  Yet when
> > > > booting a Linux kernel directly on the hardware it lists APIC, BGRT,
> > > > CSRT, DSDT, DBG2, FACP, GTDT, PPTT, RSDP, and XSDT.
> > > > 
> > > > I don't know whether Linux's ACPI code omits mention of some required
> > > > tables and merely panics if they're absent.  Yet I'm speculating the
> > > > list
> > > > of required tables has shrunk, SPCR is no longer required, and the
> > > > documentation is out of date.  Perhaps SPCR was required in early Linux
> > > > ACPI implementations, but more recent ones removed that requirement?
> > > 
> > > I have just checked and SPCR is still a mandatory table in the latest
> > > SBBR specification. It is probably one of those cases where the firmware
> > > claims to be SBBR compliant, but it is not, and it happens to work with
> > > Linux.
> > 
> > Is meeting the SBBR specification supposed to be a requirement of running
> > Xen-ARM?
> 
> This is not my goal. We should try to get Xen running everywhere as long as
> this doesn't require a lot of extra code. IOW, don't ask me to review/accept a
> port of Xen to RPI3 ;).

I agree with Julien's statement.

For context, my previous comment in regards to SBBR was because I am
positive that Masami's platform is expected to be SBBR compliant.

