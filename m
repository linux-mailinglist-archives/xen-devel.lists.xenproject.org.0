Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463F7F0DDB
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 09:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636477.991998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zte-0007aL-HC; Mon, 20 Nov 2023 08:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636477.991998; Mon, 20 Nov 2023 08:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4zte-0007XE-EP; Mon, 20 Nov 2023 08:44:46 +0000
Received: by outflank-mailman (input) for mailman id 636477;
 Mon, 20 Nov 2023 08:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mHkN=HB=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1r4ztd-0007X5-1E
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 08:44:45 +0000
Received: from smarthost01c.sbp.mail.zen.net.uk
 (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cab506f-8781-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 09:44:43 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01c.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1r4zta-00AW9o-L3;
 Mon, 20 Nov 2023 08:44:42 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 0E5048A7D65;
 Mon, 20 Nov 2023 08:44:42 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZmMwaknsj7p; Mon, 20 Nov 2023 08:44:41 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id DC78D8A7D62;
 Mon, 20 Nov 2023 08:44:41 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id DA581B8; Mon, 20 Nov 2023 08:44:41 +0000 (GMT)
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
X-Inumbo-ID: 0cab506f-8781-11ee-98df-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Mon, 20 Nov 2023 08:44:41 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	James Dingwall <james-xen@dingwall.me.uk>,
	xen-devel@lists.xenproject.org
Subject: Re: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Message-ID: <ZVsceVGKOMP2zhU9@dingwall.me.uk>
References: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
 <aa13be5e-d90c-4074-a16c-d3b051da754d@citrix.com>
 <ZVcv7259slJF4wBh@dingwall.me.uk>
 <ZVc9yq9b6fezMWcY@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVc9yq9b6fezMWcY@macbook.local>
X-Originating-smarthost01c-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On Fri, Nov 17, 2023 at 11:17:46AM +0100, Roger Pau Monné wrote:
> On Fri, Nov 17, 2023 at 09:18:39AM +0000, James Dingwall wrote:
> > On Thu, Nov 16, 2023 at 04:32:47PM +0000, Andrew Cooper wrote:
> > > On 16/11/2023 4:15 pm, James Dingwall wrote:
> > > > Hi,
> > > >
> > > > Per the msr_relaxed documentation:
> > > >
> > > >    "If using this option is necessary to fix an issue, please report a bug."
> > > >
> > > > After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
> > > > started experiencing a BSOD at boot with one of our Windows guests.  We found
> > > > that enabling `msr_relaxed = 1` in the guest configuration has resolved the
> > > > problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
> > > > the following messages were caught as the BSOD happened:
> > > >
> > > > (XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
> > > > (XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
> > > > (XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0
> > > >
> > > > I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
> > > > series from last month:
> > > >
> > > > https://patchwork.kernel.org/project/xen-devel/list/?series=796550
> > > >
> > > > Picking out just a small part of that fixes the problem for us. Although the
> > > > the patch is against 4.15.5 I think it would be relevant to more recent
> > > > releases too.
> > > 
> > > Which version of Windows, and what hardware?
> > > 
> > > The Viridian Crash isn't about the RDMSR itself - it's presumably
> > > collateral damage shortly thereafter.
> > > 
> > > Does filling in 0 for that MSR also resolve the issue?  It's model
> > > specific and we absolutely cannot pass it through from real hardware
> > > like that.
> > > 
> > 
> > Hi Andrew,
> > 
> > Thanks for your response.  The guest is running Windows 10 and the crash
> > happens in a proprietary hardware driver.
> 
> When you say proprietary you mean a custom driver made for your
> use-case, or is this some vendor driver widely available?
> 

Hi Roger,

We have emulated some point of sale hardware with a custom qemu device.  It
is reasonably common but limited to its particular sector.  As the physical
hardware is all built to the same specification I assume the driver has made
assumptions about the availability of MSR_TEMPERATURE_TARGET and doesn't
handle the case it is absent which leads to the BSOD in the Windows guest.

Regards,
James

