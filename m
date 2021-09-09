Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570A4042AD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 03:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182539.330140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO8b7-0003XX-FP; Thu, 09 Sep 2021 01:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182539.330140; Thu, 09 Sep 2021 01:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO8b7-0003Ux-CE; Thu, 09 Sep 2021 01:11:25 +0000
Received: by outflank-mailman (input) for mailman id 182539;
 Thu, 09 Sep 2021 01:11:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO8b5-0003Ur-Gg
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 01:11:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ede8905-734b-4846-9312-87f74a23a52c;
 Thu, 09 Sep 2021 01:11:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84DB361158;
 Thu,  9 Sep 2021 01:11:21 +0000 (UTC)
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
X-Inumbo-ID: 1ede8905-734b-4846-9312-87f74a23a52c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631149881;
	bh=/1kkwotCVNZUHTkoMefJIcmv7eGp0QtMuywZS/5fL3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dz2Uv7gvY675/x8u6HUrvP3sjIc/utMM/+dfUoUN+qTbLbCmMzecmi0ycsvxTKA3v
	 INzIMH9ZpdW4tJuMvJJ5WaLVXra77AtaO3uZGK4PraQxNTs9xh+jv1ksvd+ad3cg6W
	 sRQFRK6rwEu+B30XnPnn21IlBrapY4BBHYO2/PhU177T/w+NBHODCLHg7czf8m+Rcg
	 8Bgn082nruikUnq2foWOTxJibZ+TrnrT1jp5Du3Zb1tzzVa4UP91FMaR62d/VXmLNO
	 PAuu0eTgllxgJwWJ8Z+NyrWy2pg/09cFv82BX8p1DS4EwJ5jqV4YG1WbV2Z+Rj4xJN
	 Q4KttPAHv28DA==
Date: Wed, 8 Sep 2021 18:11:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Rahul Singh <Rahul.Singh@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
In-Reply-To: <a8982dae-0928-3230-f10d-ada277bc8397@suse.com>
Message-ID: <alpine.DEB.2.21.2109081802190.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com> <5fad114f-06c4-120e-0a48-da7045fb85c5@suse.com> <76520AA8-D02C-4207-A722-33D935E76776@arm.com>
 <a8982dae-0928-3230-f10d-ada277bc8397@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-554672202-1631149778=:10523"
Content-ID: <alpine.DEB.2.21.2109081809450.10523@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-554672202-1631149778=:10523
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109081809451.10523@sstabellini-ThinkPad-T480s>

On Fri, 20 Aug 2021, Jan Beulich wrote:
> On 20.08.2021 13:41, Rahul Singh wrote:
> > Hi Jan
> > 
> >> On 20 Aug 2021, at 8:06 am, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 19.08.2021 14:02, Rahul Singh wrote:
> >>> Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
> >>> architecture. Move the code under CONFIG_X86 flag to gate the code for
> >>> ARM.
> >>
> >> Please give at least one example of what it is that fails to compile.
> >> What an appropriate action is depends on the nature of the error(s),
> >> and from looking at the enclosed code I cannot easily see what it
> >> might be that breaks for Arm.
> > 
> > I am observing below error when enabled ACPI && HAS_PCI for ARM.
> > 
> > prelink.o: In function `pcie_aer_get_firmware_first’:
> > /xen/drivers/passthrough/pci.c:1251: undefined reference to `apei_hest_parse'
> > aarch64-linux-gnu-ld: /home/rahsin01/work/xen/pci-passthrough-upstream/xen/xen/.xen-syms.0: hidden symbol `apei_hest_parse' isn't defined
> > 
> > I found that apei/ is only enabled for x86 and pcie_aer_get_firmware_first() is only called from x86 code.
> > obj-$(CONFIG_X86) += apei/
> > 
> > I am not sure whether we need this code for ARM architecture 
> > that is why I gate the code for ARM via CONFIG_X86
> 
> So you Arm folks will probably want to settle on that aspect first. What
> is wanted to keep things building depends on that.

Reading the APEI description, it looks like there might be some use for
it on ARM but it would work a bit differently from x86 as there are no
NMIs on ARM. So enabling APEI on ARM is not just a matter of enabling
the build of apei/, it is not going to be straightforward.

For the scope of this series (which is actually about PCI), I would
leave it alone, and keep apei/ x86 only, which means #ifdefing
pcie_aer_get_firmware_first.

I would just add an in-code comment saying "APEI not supported on ARM
yet". Another option would be to introduce a symbol like HAS_ACPI_APEI
but it is a bit overkill for this.
--8323329-554672202-1631149778=:10523--

